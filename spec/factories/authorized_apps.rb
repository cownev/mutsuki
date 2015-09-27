FactoryGirl.define do
  factory :authorized_app do
    name "test-app"
    key  SecureRandom.hex(8)
  end
end
