require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "needs authentication" do
    get :index
    assert_redirected_to :controller => "admin", :action => "login"
  end
 
  test "index without user" do 
    get :index 
    assert_redirected_to :action => "login" 
    assert_equal "Please log in", flash[:notice] 
  end 

  test "index with user" do 
    get :index, {}, { :user_id => users(:one).id } 
    assert_response :success 
    assert_template "index" 
  end 

  
  test "login" do 
    one = users(:one) 
    post :login, :name => one.name, :password => 'cat' 
    assert_redirected_to :action => "index" 
    assert_equal one.id, session[:user_id] 
  end 

  test "bad password" do 
     one = users(:one) 
     post :login, :name => one.name, :password => 'wrong' 
     assert_template "login" 
   end 

end

 
