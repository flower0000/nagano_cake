class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    #Itemモデルのデータをすべて取得．
    #アクションごとに表示させる1ページあたりに表示させるデータ上限を設定（今回は8つ）し，html側でページャ機能を持たせる記述をすることで
    #9つ目以降のデータを次ページとして表示。
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_item.new
  end


#ストロングパラメータの設定を確認
  private

  def cart_item_params
    params.require(:item).permit(:item.id, :amount)
  end

end
