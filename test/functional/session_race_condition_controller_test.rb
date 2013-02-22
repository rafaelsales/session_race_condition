require 'test_helper'

class SessionRaceConditionControllerTest < ActionController::TestCase

  test "should get change_session_one" do
    get :change_session_one
    assert_equal 'Hello', session[:one]
    assert_response :success
  end

  test "should get change_session_two" do
    get :change_session_two
    assert_equal 'World!', session[:two]
    assert_response :success
  end
end
