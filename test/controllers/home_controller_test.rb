require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get page1" do
    get :page1
    assert_response :success
  end

end
