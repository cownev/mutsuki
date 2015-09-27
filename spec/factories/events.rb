FactoryGirl.define do
  sequence(:name) { |n| "event-#{n}" }

  factory :event do
    name        
    date "2015-01-01"

    trait :private do
      private_flg 1
    end
    
    trait :open do
      private_flg 0
    end
  end
end
