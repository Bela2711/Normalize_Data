require 'test_helper'

class PurchaserTest < ActiveSupport::TestCase
  test "should save merchant with unique name" do
   purchaser = Purchaser.create(name: "random name to test")
   assert purchaser.valid?
   another_purchaser = Purchaser.create(name: "random name to test")
   another_purchaser.valid?
   assert_not_nil another_purchaser.errors.get(:name)
   end
end
