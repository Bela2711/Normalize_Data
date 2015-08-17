class Purchaser < ActiveRecord::Base
      has_many :orders
      has_many :items, through: :orders
      validates_uniqueness_of :name
end
