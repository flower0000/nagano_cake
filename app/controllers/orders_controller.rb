class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items#ユーザーの全カートアイテム
    @total = 0 #@totalを後で使用できるように宣言
    
    @cart_items.each do |cart_item|#カートアイテムの合計金額
      @total +=  (cart_item.item.price * 1.1).floor * cart_item.amount
    end
    
    
    if params[:order][:address_select].to_i == 0 #自身の住所

      #formから受け取った値は文字列として扱われるので整数（数値）に戻してあげる
      #注文の変数を準備。それに対して値を入れていく工程を下記記述
      #addressとaddress_nameとpostal_codeが条件によって変わってくる。

       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.address_name = current_customer.first_name + current_customer.last_name
       #current_customerの情報を入れていく。formに値が入っていたとしてもログインユーザーの情報が入るよう設定。


    #elsif params[:order][:address_select].to_i == 1 #新規入力住所
    #場合分けする必要があれば別途追記
    
    end

    #addressとaddress_nameとpostal_code以外の情報はif文の外に記述していく
    #他のモデル(table)からデータを引っ張ってくる)
    #scheamaファイルを確認しながら必要な情報の洩れが内容記述していく





#ハッシュの取り出し方
#Parameters : { "id": 1 }というパラメータというハッシュがあって，idというキーに対して値をとして1がある。

#params[:id]
#=> 1

#User.find(params[:id])
#User.find(1)

#Parameter: { "abc" : 4 }
#params[:abc]
#=> 4

#// 今回
#Parameters : { order: { payment_method: 1, address_select: 0 } }
#パラメーターというハッシュの中にorderというハッシュがありさらにその中にpayment_methodとaddress_selectというキーがある．それに対し値を1と0をそれぞれ持っている。
#params[:order]

#=> order: { payment_method: 1, address_select: 0 }
#params[:order][:address_select]
#= 0
  end




  def thanks

  end


  def create

  end


  def index

  end


  def show

  end


  private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :address_name, :member_id, :postage)
      #送られてくるデータで保存する必要があるか無いかでストロングパラメータ内に記述する内容を決める。
      #なので、お届け先のaddress_selectは飛ばす(保存)必要がないため記述しない。ただし，使用は可能なので間違えないように。
    end

end
