class UserEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :user,
    :uniqueness => {:scope =>:event}
end
