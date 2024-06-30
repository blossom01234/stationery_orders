class Product < ApplicationRecord
  belongs_to :maker, optional: true
  has_many :order_details, dependent: :destroy
  validates :name, presence:true
  validates :jancode, presence:true
  validates :product_code, presence:true
  validates :price, presence:true
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [2000, 2000]
  end
end