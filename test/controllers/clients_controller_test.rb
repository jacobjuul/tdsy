require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  test "should get import" do
    get :import
    assert_response :success
  end

end
