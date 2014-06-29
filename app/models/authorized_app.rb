class AuthorizedApp < ActiveRecord::Base
  validates :name, :key,
    presence: true,
    uniqueness: true
  validates :key, 
    length: { is: 16 },
    format: { with: /\A[\w]+\z/ }
end
