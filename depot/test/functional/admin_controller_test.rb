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
  
  test "login" do 
    dave = users(:one) 
    post :login, :name => one.name, :password => 'cat' 
    assert_redirected_to :action => "index" 
    assert_equal one.id, session[:user_id] 
  end 

  test "bad password" do 
     dave = users(:one) 
     post :login, :name => one.name, :password => 'wrong' 
     assert_template "login" 
   end 

end

 
