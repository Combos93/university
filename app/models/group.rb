class Group < ApplicationRecord
  belongs_to :course

  has_many :user_groups
  has_many :students, through: :user_groups

  validates :start_date, presence: true
  validates :finish_date, presence: true

  validate :correct_dates

  private

  def correct_dates
    return unless start_date && finish_date

    errors.add :finish_date, I18n.t('error_range_date') if finish_date < start_date
  end
end
