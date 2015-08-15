require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "should save merchant with unique name" do
   merchant = Merchant.create(name: "random name to test")
   assert merchant.valid?
   another_merchant = Merchant.create(name: "random name to test")
   another_merchant.valid?
   assert_not_nil another_merchant.errors.get(:name)
   end
end
