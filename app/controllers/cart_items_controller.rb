class CartItemsController < ApplicationController



  def index
    @cart_items = current_customer.cart_items
    #1ユーザー(current_customer)のみの全cart_itemデータを取得する
    @total = 0
    #viewで計算できるよう0を代入して渡してあげる
  end


  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update
    redirect_to cart_items_path
  end


  def destroy

  end


  def destroy_all

  end


  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.save
    redirect_to cart_items_path
  end

  #ストロングパラメータの設定
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    #ストロングパラメータはデータの送られ先（受け身側）で値を受け取る側に入力．送信するコントローラーには必要なし。
  end


end
