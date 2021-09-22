class HomesController < ApplicationController
  def top
    @items = Item.page(params[:page]).reverse_order
  end
#アソシエーションとは関係なく別モデルのデータを参照する場合はどうすべきか？
#→
end