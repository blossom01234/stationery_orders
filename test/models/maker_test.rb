require "test_helper"

class MakerTest < ActiveSupport::TestCase
  def setup 
    @maker = makers(:kokuyo)
  end

  test "maker_association" do
    assert_not @maker.nil?
    assert @maker.products.count >= 1
  end
end
