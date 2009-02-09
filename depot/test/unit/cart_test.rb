require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def test_initialize
    cart = Cart.new
    assert_equal 0, cart.items.length
  end

  def test_add_product
    cart = Cart.new
    cart.add_product(products(:one))
    assert_equal 1, cart.items.length
  end

  def test_chevron
    cart = Cart.new
    #cart << products(:one)
    cart.add_product(products(:one))
    assert_equal 1, cart.items.length
  end

  def test_add_second_of_same_item
    cart = Cart.new
    cart.add_product(products(:one))
    cart.add_product(products(:one))
    assert_equal 2, cart.items[0].quantity
  end

  def test_total_price
    cart = Cart.new
    cart.add_product(products(:one))
    assert_equal 100.00, cart.total_price
    cart.add_product(products(:one))
    assert_equal 200.00, cart.total_price
  end

  def test_total_items
    cart = Cart.new
    assert_equal 0, cart.total_items
    cart.add_product(products(:one))
    assert_equal 1, cart.total_items
  end
end