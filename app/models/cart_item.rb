class CartItem < ApplicationRecord

   belongs_to :item
   belongs_to :customer

#値が存在すればtrueを返す
validates :amount, presence: true

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end

end
