require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:yamada)
  end

  test "user_association" do
    assert_not @user.nil?
  end
end
