require 'test_helper'
include Devise::TestHelpers

class UsersControllerTest < ActionController::TestCase
  test "should get upload_data" do
    sign_in users(:one)
    get :upload_data
    assert_response :success
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_select 'div#uploadfile', :count => 1
  end

  test "should log out the user" do
    sign_in users(:one)
    sign_out(:one)
    get :sign_out_user
    assert_response :success
    assert_select 'div#signed_out', :count => 1
  end

  test "should save data and get revenue" do
    sign_in users(:one)
upload = ActionDispatch::Http::UploadedFile.new({
  :filename => 'example_data.csv',
  :content_type => 'text/csv',
  :tempfile => File.new("#{Rails.root}/test/fixtures/example_data.csv")
})
    post = UploadFile.new(users(:one).id)
    post.save(upload)
    revenue = post.revenue
    assert_equal(revenue,95)
  end

end
