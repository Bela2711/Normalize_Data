require 'test_helper'

class UploadFileTest < ActiveSupport::TestCase
 #tests revenue returned by UploadFile model is correct or not
 #also tests if data is saved in the databse tables
  test "should save data and get revenue" do
    upload = ActionDispatch::Http::UploadedFile.new({
  :filename => 'example_data.csv',
  :content_type => 'text/csv',
  :tempfile => File.new("#{Rails.root}/test/fixtures/example_data.csv")
    })
     post = UploadFile.new(users(:one).id)
     post.save(upload)
     revenue = post.revenue
     assert_equal(revenue,95)

     #I don't think this is a great way to test the database
     p = Purchaser.exists?(:name => "Snake Plissken")
     assert p

     m = Merchant.exists?(:name => "Sneaker Store Emporium")
     assert p

     i = Item.exists?(:description => "$30 of awesome for $10")
     assert p
     assert m
     assert i

     o = Order.any?
     assert o
     
     im = ItemsMerchant.any?
     assert im
   end
end
