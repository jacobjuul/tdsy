require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "Should get competition signup page" do
    get :new
    assert_response :success
    assert_select "title", "Tdsy competition"
  end

  test "Should get the admin page" do
    get :admin
    assert_response :success
    assert_select "title", "Tdsy Admin"
  end
end
