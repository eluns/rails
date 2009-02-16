require 'test_helper'
 
class AdminControllerTest < ActionController::TestCase
  test "needs authentication" do
    get :index
    assert_redirected_to :controller => "admin", :action => "login"
  end
 
  test "logged in" do
    @request.session[:user_id] = users(:one).id #put in setup
    get :index
    assert_response :success
  end
end

 
