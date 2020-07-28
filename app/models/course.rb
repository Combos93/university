class Course < ApplicationRecord
  has_one :new_group, -> { group_by_future }, class_name: 'Group'
  has_many :groups, dependent: :destroy

  scope :sort_by_name, -> { includes(:new_group).order(name: :asc) }
  scope :sort_by_start_date, lambda {
    preload(:new_group)
    joins('left join groups on groups.course_id = courses.id')
      .select('courses.*, min(groups.start_date) AS min_date_start')
      .where('groups.finish_date > ?', Date.current)
      .group('courses.id')
      .order('min_date_start ASC')
  }
end
