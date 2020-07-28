FactoryBot.define do
  factory :student do
    email { 'admin@example.com' }
    role { 'admin' }

    trait :admin do
      email { 'admin@example.com' }
      role { 'admin' }
      name { 'student' }
    end

    trait :student do
      email { 'student@example.com' }
      role { 'student' }
      name { 'student' }
    end

    trait :professor do
      email { 'professor@example.com' }
      role { 'professor' }
      name { 'student' }
    end
  end
end
