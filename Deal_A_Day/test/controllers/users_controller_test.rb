require 'test_helper'
include Devise::TestHelpers

class UsersControllerTest < ActionController::TestCase
  #tests if user is signed in
  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_select 'div#uploadfile', :count => 1
  end

  #tests if it loads upload_data page
  test "should get upload_data" do
    sign_in users(:one)
    get :upload_data
    assert_response :success
  end

  #testing log out functionality
  test "should log out the user" do
    sign_in users(:one)
    sign_out(:one)
    get :sign_out_user
    assert_response :success
    assert_select 'div#signed_out', :count => 1
  end

  #can be done by using fixture_file_upload
  #tests if it shows success message when file gets uploaded
  test "should upload file and get revenue" do
    sign_in users(:one)
    upload = ActionDispatch::Http::UploadedFile.new({
  :filename => 'example_data.csv',
  :content_type => 'text/csv',
  :tempfile => File.new("#{Rails.root}/test/fixtures/example_data.csv")
    })
     post(:submit_data, {"uploaded_file" => upload},{"current_user" => users(:one)})
     assert_select 'div#sub_data', :count => 1
  end

test "should redirect to upload page back with flag set to 1 when file is not selected while uploading the file" do
    sign_in users(:one)
    upload = nil
     post(:submit_data, {"uploaded_file" => upload},{"current_user" => users(:one)})
     assert_redirected_to "/users/upload_data?resubmit=1" , @response.body
  end

end
