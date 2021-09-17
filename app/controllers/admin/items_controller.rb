class Admin::ItemsController < ApplicationController

  def index

  end



  def new
    @item = Item.new
  end




  def create
    @item = Item.new(item_params) #追加した商品情報をインスタンス変数に入れる
    @item.save #情報をセーブ
    redirect_to item_path(@item.id) #商品詳細ページに遷移
  end




  def show

  end




  def edit

  end




  def update

  end
  
  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price)
  end
  
end
