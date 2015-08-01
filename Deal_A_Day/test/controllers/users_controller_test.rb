require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get upload_data" do
    get :upload_data
    assert_response :success
  end

end
