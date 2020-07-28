class Student < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups

  enum role: {
    admin: 1,
    student: 2,
    professor: 3
  }
end