class Product < ApplicationRecord
  belongs_to :maker
  has_many :order_details, dependent: :destroy
end
