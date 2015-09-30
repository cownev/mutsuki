class Event < ActiveRecord::Base
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :name, :date, :creator_user_id,
    presence: true

  validates :private_flg, 
    inclusion: {in: [true, false]}
end
