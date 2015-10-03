require 'rails_helper'

describe UserEvent, type: :model do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:event) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:event_id) }

end
