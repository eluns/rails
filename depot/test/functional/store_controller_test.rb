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
  
  test "es option work" do
    get :index, :locale => "es"
    assert_response :success
    assert_equal "es", @response.session[:locale]
  end
 
  test "only es and en should work" do
    get :index, :locale => "jp"
    assert_response :success
    assert_equal "en", @response.session[:locale]
    assert_equal "jp translation not available", @response.flash[:notice]
  end
  
end
