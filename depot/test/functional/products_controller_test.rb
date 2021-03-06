require 'test_helper'
 
class ProductsControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = users(:one).id
  end
 
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => {
        :title => 'asdf',
        :description => 'foo',
        :price => '1.2',
        :image_url => 'foo.gif',
      }
    end
 
    assert_redirected_to product_path(assigns(:product))
  end
 
  test "should show product" do
    get :show, :id => products(:one).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => products(:one).id
    assert_response :success
  end
 
  test "should update product" do
    put :update, :id => products(:one).id, :product =>
      products(:one).attributes.merge({:title => 'xxxxx'})
    assert_redirected_to product_path(assigns(:product))
  end
 
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => products(:one).id
    end
 
    assert_redirected_to products_path
  end
end
 