require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "should save merchant with unique address" do
   merchant = Merchant.create(address: "random address to test")
   assert merchant.valid?
   another_merchant = Merchant.create(address: "random address to test")
   another_merchant.valid?
   assert_not_nil another_merchant.errors.get(:address)
   end
end
