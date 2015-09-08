class User < ActiveRecord::Base
  has_many :user_events, dependent: :destroy
  has_many :events, through: :user_events

  before_validation :check_whitespace, :only => [:os]

  private
  def check_whitespace
    self.os = 'Other' if self.os.blank?
  end
end
