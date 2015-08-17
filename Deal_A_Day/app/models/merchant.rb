class Merchant < ActiveRecord::Base
  validates_uniqueness_of :address
  has_many :items, through: :items_merchant
end
