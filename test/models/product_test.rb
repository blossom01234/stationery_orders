require "test_helper"

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:one)
  end

  test "product_associatoin" do
    assert_not @product.nil?
    assert @product.order_details.count >= 1
    assert_not @product.maker.nil?
  end
end
