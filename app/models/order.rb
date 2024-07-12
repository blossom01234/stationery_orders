class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  def customer_full_name
    "#{customer.try(:first_name)} #{customer.try(:last_name)}"
  end
end
