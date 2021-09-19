class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end



  def new
    @item = Item.new
  end




  def create
    @item = Item.new(item_params) #追加した商品情報をインスタンス変数に入れる
    @item.save #情報をセーブ
    redirect_to admin_item_path(@item.id) #商品詳細ページに遷移
  end




  def show
    @item = Item.find(params[:id])
    #管理者側が登録した商品をエンドユーザー側が確認するには@item = Item.find(params[:id])と，同じ記述をすれば良い．
    #理由としては参照するモデルが同じため，あくまでログインしているユーザーで挙動を変えているだけ．
  end




  def edit
    @item = Item.find(params[:id])
    #製品詳細のデータを取得
  end




  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price)
  end

end
