class Course < ApplicationRecord
  has_many :groups, dependent: :destroy
end
