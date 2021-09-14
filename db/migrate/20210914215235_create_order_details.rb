class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      
      #追加カラム
      t.integer :order_id
      t.integer :item_id
      t.integer :unit_price
      t.integer :quantity
      #ここまで

      t.timestamps
    end
  end
end
