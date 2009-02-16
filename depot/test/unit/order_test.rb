require 'test_helper'
 
class OrderTest < ActiveSupport::TestCase
  
  test "No name gets an error" do
    order = orders(:one)
    order.name = ""
    assert ! order.valid?
    assert order.errors.on(:name)
  end
  
  test "contains name" do
    order = orders(:one)
    order.name = "Bob"
    assert order.save!
  end
  
  test "order contains address" do
    order = orders(:one)
    order.address = "Beach Ave"
    assert order.save!
  end
  
  test "No address throws an error" do
    order = orders(:one)
    order.address = ""
    assert ! order.valid?
    assert order.errors.on(:address)
  end
  
  test "Not a pay option" do
    order = orders(:one)
    order.pay_type = "poop"
    assert ! order.valid?
    assert order.errors.on(:pay_type)
  end
 
  test "No email" do
    order = orders(:one)
    order.email = ""
    assert ! order.valid?
    assert order.errors.on(:email)
  end
  
end
