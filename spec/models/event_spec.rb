require 'rails_helper'

describe Event, type: :model do
  it { should have_many(:users) }
  it { should have_many(:user_events) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :date }
  it { is_expected.to validate_presence_of :creator_user_id }
  
  context "has valid event" do
    it "set valid value" do
      event = Event.new(name: 'test-event', date: '2015-01-01', creator_user_id: 0, private_flg: 1)
      expect(event).to be_valid
      expect(event.name).to eq 'test-event'
    end
  end
end
