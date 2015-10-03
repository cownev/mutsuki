FactoryGirl.define do
  factory :authorized_app do
    name "auth-app"
    key  SecureRandom.hex(8)
  end
end
