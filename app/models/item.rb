class Item < ApplicationRecord
   has_many :cart_items, dependent: :destroy
   has_many :order_details, dependent: :destroy
   
   attachment :image #(image_idの_idは含めず入力)
end
