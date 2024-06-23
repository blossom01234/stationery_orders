require "test_helper"

class OrderDetailTest < ActiveSupport::TestCase
  def setup
    @order_detail = order_details(:one)
  end

  test "order_detail_associtation" do
    assert_not @order_detail.nil?
    assert_not @order_detail.order.nil?
    assert_not @order_detail.product.nil?
  end
end
