require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)

    Product.find_products_for_sale.each do |product|
      assert_tag :tag => 'h3', :content => product.title
      assert_match /#{sprintf("%01.2f", product.price)}/, @response.body
    end
  end
   
  test "session contains cart" do
	get :index
	assert session[:cart]
  end
  
   test "add_to_carts adds a product to the cart" do
    post :add_to_cart, :id => products(:one).id
    assert_response :success
    assert cart = assigns(:cart)
    assert_equal 1, cart.items.length
  end
  
end
