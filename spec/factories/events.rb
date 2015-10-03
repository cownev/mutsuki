FactoryGirl.define do
  factory :event do
    sequence(:name) { |n| "event-#{n}" }
    sequence(:date) { |n| "201#{n}-01-01" }

    trait :private do
      private_flg 1
    end
    
    trait :open do
      private_flg 0
    end
  end
end
