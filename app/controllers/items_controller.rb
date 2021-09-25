class ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    #Itemモデルのデータをすべて取得．
    #アクションごとに表示させる1ページあたりに表示させるデータ上限を設定（今回は8つ）し，html側でページャ機能を持たせる記述をすることで
    #9つ目以降のデータを次ページとして表示。
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new 
    #モデルの記述は_を無くし，_後を大文字にして
    #Cart_itemモデル内にデータを保存する用のスペースを作ってあげる．コントローラー名と違うモデルでも問題なくできる
  end

end
