class User < ActiveRecord::Base
  has_secure_password
  has_many :products
  has_many :products_user, through: :markets, source: :products

  validates :first_name, :last_name, :email, presence: true
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
