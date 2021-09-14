class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      #追加カラム
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      #ここまで
      
      t.timestamps
    end
  end
end
