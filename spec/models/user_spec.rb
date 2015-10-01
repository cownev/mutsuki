require 'rails_helper'

describe User, type: :model do

  it { should have_many(:events) }
  it { should have_many(:user_events) }

  context "has valid user" do
    it "set iOS to os field" do
      user = User.new( os: 'iOS')
      expect(user).to be_valid
      expect(user.os).to eq 'iOS'
    end
    it "set 'Other' to os field when os field doesn't have value" do
      user = User.new()
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
    it "set 'Other' to os field when os field is ''" do
      user = User.new(os: '')
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
    it "set 'Other' to os field when os field is nil" do
      user = User.new(os: nil)
      expect(user).to be_valid
      expect(user.os).to eq 'Other'
    end
  end
end
