class Item < ActiveRecord::Base
    has_many :orders
    has_many :purchasers, through: :orders
    has_many :merchants, through: :items_merchant
    validates_uniqueness_of :description
end
