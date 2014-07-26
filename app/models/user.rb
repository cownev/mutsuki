class User < ActiveRecord::Base
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  validates :fid,
    presence: true,
    uniqueness: true
end
