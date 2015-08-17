class ItemsMerchant < ActiveRecord::Base
  belongs_to :item
  belongs_to :merchant
  validates :item_id,uniqueness:{scope: :merchant_id}
end
