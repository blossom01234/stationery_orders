class Product < ApplicationRecord
  belongs_to :maker
  has_many :order_details, dependent: :destroy
  validates :name, presence:true
  validates :jancode, presence:true
  validates :product_code, presence:true
  validates :price, presence:true
end
