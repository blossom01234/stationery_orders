require "test_helper"

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
  end

  test "order_association" do
    assert_not @order.nil?
    assert @order.order_details.count >= 1
    assert_not @order.customer.nil?
  end
end
