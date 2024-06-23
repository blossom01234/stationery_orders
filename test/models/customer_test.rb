require "test_helper"

class CustomerTest < ActiveSupport::TestCase

  def setup
    @customer = customers(:tanaka)
  end

  test "customer_association" do
    assert_not @customer.nil?
    assert @customer.orders.count >= 1
  end
end
