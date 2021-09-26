class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_details, dependent: :destroy

   #enum定義（支払方法選択用）
   enum payment_method: { credit_card: 0, transfer: 1 }
end
