require 'rails_helper'

describe User, type: :model do

  it { is_expected.to have_many(:events) }
  it { is_expected.to have_many(:user_events) }

  context "has valid user" do
    it "set iOS to os field" do
      #user = User.new( os: 'iOS')
      user = FactoryGirl.create(:new_user, os: 'iOS')
      expect(user).to be_valid
      expect(user.os).to eq 'iOS'
    end
    it "set 'Other' to os field when os field doesn't have value" do
      user = FactoryGirl.create(:new_user)
      #user = User.new()
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
    it "set 'Other' to os field when os field is ''" do
      user = FactoryGirl.create(:new_user, os: '')
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
    it "set 'Other' to os field when os field is nil" do
      user = FactoryGirl.create(:new_user, os: nil)
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
  end
end
