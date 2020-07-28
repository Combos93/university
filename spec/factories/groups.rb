FactoryBot.define do
  factory :group do
    course { course }

    trait :future_group do
      start_date { Date.current + 27.days }
      finish_date { Date.current + 37.days }
    end

    trait :current_group do
      start_date { Date.current - 17.days }
      finish_date { Date.current + 17.days }
    end

    trait :past_group do
      start_date { Date.current - 67.days }
      finish_date { Date.current - 57.days }
    end
  end
end
