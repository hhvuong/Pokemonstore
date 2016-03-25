require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  test "should get new_login" do
    get :new_login
    assert_response :success
  end

  test "should get show_logins" do
    get :show_logins
    assert_response :success
  end

  test "should get login_form" do
    get :login_form
    assert_response :success
  end

  test "should get registration_confirmation" do
    get :registration_confirmation
    assert_response :success
  end

end
