class Product < ActiveRecord::Base
  belongs_to :user
  has_many :markets, dependent: :destroy
  has_many :users_product, through: :markets, source: :user

  validates :name, :price, presence: true
end
