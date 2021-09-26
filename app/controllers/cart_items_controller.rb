class CartItemsController < ApplicationController



  def index

    @cart_items = current_customer.cart_items
    #1ユーザー(current_customer)のみの全cart_itemデータを取得する
    @total = 0
    #viewで計算できるよう0を代入して渡してあげる
  end


  def update#カート内商品データ更新(カート内の商品注文個数変更)
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end


  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    #現在ログインしているデータの全カートアイテムの中から該当するIDを持つデータを取得

    cart_item.destroy
    #該当データを削除

    redirect_to cart_items_path
  end


  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    #既にあるデータと送られてきたデータを分けるためにこっちの変数に@を付けている．
    #cart_itemはもともと保存してあったデータ側なので間違えずに使用

    if current_customer.cart_items.find_by(item_id: @cart_item.item_id).present?
      #.present?でデータの有無の確認をする．あればtrueでなければfalseを返す。

      #current_customerのカートアイテムの全データ（モデル）をfindメソッドを使用して検索。
      #find_by(item_id: @cart_item.item_id)→find_by(item_id: params[:cart_item][:items_id])
      #飛ばされてきたデータ　params[:cart_item]。この中のitem_idを探す。

      #ストロングパラメータ（フォームから送られてきた値）をデータを探すときにそのまま使用できる

      cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      #ログインしているユーザーの全カートアイテム情報から，見つけたいデータ(item_id)を指定して、@cart_item.item_id(同じ商品id)を持つデータが無いか検索する．
      #あればそのIDを持つ1レコード分のデータをcart_itemに入れている
      cart_item.amount += @cart_item.amount.to_i

      cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  #ストロングパラメータの設定
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    #ストロングパラメータはデータの送られ先（受け身側）で値を受け取る側に入力．送信するコントローラーには必要なし。
  end


end
