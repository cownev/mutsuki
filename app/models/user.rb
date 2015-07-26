class User < ActiveRecord::Base
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  validates :fid,
    presence: true,
    uniqueness: true

  before_validation :check_whitespace, :only => [:gender]

  private
  def check_whitespace
    self.gender = nil if self.gender.blank?
  end
end
