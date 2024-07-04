require "test_helper"

class CartTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:tanaka)
  end
  test "Cart取得" do
    carts = Cart.includes(:product)
      .references(:product)
      .where(customer_id: @customer.id)
    assert carts.count >= 2
    carts.each do |cart|
      assert cart.product.name
    end
  end
end
