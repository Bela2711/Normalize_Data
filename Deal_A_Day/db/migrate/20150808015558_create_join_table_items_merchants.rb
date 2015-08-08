class CreateJoinTableItemsMerchants < ActiveRecord::Migration
  def change
    create_join_table :items, :merchants do |t|
      t.index [:item_id, :merchant_id]
      # t.index [:merchant_id, :item_id]
      t.decimal :price, :precision =>10 , :scale =>2
    end
  end
end
