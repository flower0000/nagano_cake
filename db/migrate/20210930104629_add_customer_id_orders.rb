class AddCustomerIdOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :customer
    #ordersテーブルがcustomerを参照できるようにする
    #結果は外部キーとしてcustomer_idカラムをordersテーブルに追加してあげる状態になる
  end
end
