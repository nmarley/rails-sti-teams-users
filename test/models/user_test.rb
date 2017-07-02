require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(login: 'nmarley')
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without login" do
    user = User.new(email: 'nate@example.com')
    assert_not user.save, "Saved the user without a login"
  end
end
