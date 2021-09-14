class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      #追加カラム
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      #ここまで

      t.timestamps
    end
  end
end
