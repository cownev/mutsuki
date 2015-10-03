require 'rails_helper'

describe AuthorizedApp, type: :model do

  let(:key) {SecureRandom.hex(8)}

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :key}
  it { is_expected.to validate_uniqueness_of :name }
  it { is_expected.to validate_uniqueness_of :key }
  it { is_expected.to validate_length_of(:key).is_equal_to(16) }
  it { is_expected.to allow_value(key).for(:key) }

  it "has valid authorized_app" do
    authorized_app = AuthorizedApp.new( name: 'auth-app', key: key)
    expect(authorized_app).to be_valid
    expect(authorized_app.name).to eq 'auth-app'
    expect(authorized_app.key).to eq key
  end
end
