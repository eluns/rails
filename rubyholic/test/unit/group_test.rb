require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end
 
  test "name must be unique" do
    group = Group.new
    group.name = groups(:one).name
    assert ! group.valid?
    assert group.errors.on(:name)
  end
end
