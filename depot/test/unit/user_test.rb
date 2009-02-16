require 'test_helper'
 
class UserTest < ActiveSupport::TestCase

  test "validates presence of name" do
    user = users(:one)
    assert_valid user
    user.name = nil
    assert !user.valid?
    assert user.errors.on(:name)
  end

  test "user validates that password is not blank" do
    user = User.new
    assert ! user.valid?
    assert user.errors.on(:password)
  end
 
  test "cannot authenticate with bad password" do
    assert ! User.authenticate("Bob", "bad")
  end
 
  test "cannot authenticate with bad username" do
    assert ! User.authenticate("Jimmy", "cat")
  end
 
  test "can authenticate Bob" do
    assert User.authenticate("Bob", "kitty")
  end
 
end