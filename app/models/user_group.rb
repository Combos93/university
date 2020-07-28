class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :student

  # validates :student_id, uniqueness: true
end
