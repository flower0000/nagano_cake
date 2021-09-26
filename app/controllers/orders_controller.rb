class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    #addressとaddress_nameとpostal_code以外の情報はif文の外に記述していく
    #他のモデル(table)からデータを引っ張ってくる)
    #scheamaファイルを確認しながら必要な情報の洩れが内容記述していく


    if params[:order][:address_select].to_i == 0
      #formから受け取った値は文字列として扱われるので整数（数値）に戻してあげる
      #注文の変数を準備。それに対して値を入れていく工程を下記記述
      #addressとaddress_nameとpostal_codeが条件によって変わってくる。
      #current_customerの情報を入れていく

    elsif params[:order][:address_select].to_i == 1
      #formから送られてきた値を取り出して、orderのカラムとしてデータを入力する。


    end
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
      params.require(:order).permit(:payment_method, :postal_code, :address, :address_name)
      #送られてくるデータで保存する必要があるか無いかでストロングパラメータ内に記述する内容を決める。
      #なので、お届け先のaddress_selectは飛ばす必要がないため記述しない。ただし，使用は可能なので間違えないように。
    end

end
