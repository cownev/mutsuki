FactoryGirl.define do
  factory :user do
    os "iOS"

    after(:create) do |user|
      3.times do
        create(:user_event, user: user, event: create(:event, :private, creator_user_id: user.id))
      end
    end
  end
end
