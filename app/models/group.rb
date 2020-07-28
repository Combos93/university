class Group < ApplicationRecord
  belongs_to :course

  has_many :user_groups
  has_many :students, through: :user_groups

  validates :start_date, presence: true
  validates :finish_date, presence: true

  validate :correct_dates

  scope :with_students, -> { includes(:user_groups).where.not(user_groups: { id: nil }) }
  scope :group_by_future, -> { where('start_date >= ?', Date.current).order(start_date: :asc) }
  scope :current_group, lambda {
    where('start_date < ? AND finish_date >= ?', Date.current, Date.current)
      .order(start_date: :asc)
  }
  scope :group_by_past, -> { where('finish_date < ?', Date.current).order(start_date: :desc) }

  def all_students
    students.where(role: :student)
  end

  private

  def correct_dates
    return unless start_date && finish_date

    errors.add :finish_date, I18n.t('error_range_date') if finish_date < start_date
  end
end
