class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def check
    @order = Order.new(order_params)
    #モデルを介するデータのやり取りをする場合は，設定されたカラム以外のデータを入れようとするとエラーが発生する。

    @cart_items = current_customer.cart_items#ユーザーの全カートアイテム


    @total = 0 #@totalを後で使用できるように宣言


    @cart_items.each do |cart_item|#カートアイテムの合計金額。モデルに記述したメソッドを使用しても良いが今回はこちらでも記述してみる
      @total +=  (cart_item.item.price * 1.1).floor * cart_item.amount
    end


    if params[:order][:address_select].to_i == 0 #自身の住所

      #formから受け取った値は文字列として扱われるので整数（数値）に戻してあげる
      #注文の変数を準備。それに対して値を入れていく工程を下記記述
      #addressとaddress_nameとpostal_codeが条件によって変わってくる。

       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.address_name = current_customer.last_name + current_customer.first_name
       #current_customerの情報を入れていく。formに値が入っていたとしてもログインユーザーの情報が入るよう設定。


    #elsif params[:order][:address_select].to_i == 1 #新規入力住所
    #場合分けする必要があれば別途追記

    end

    #addressとaddress_nameとpostal_code以外の情報はif文の外に記述していく
    #他のモデル(table)からデータを引っ張ってくる)
    #scheamaファイルを確認しながら必要な情報の洩れが内容記述していく

  end




  def thanks

  end


  def create
    @order = Order.new(order_params)

    @order.save

    @cart_items = current_customer.cart_items#ユーザーの全カートアイテム

    @cart_items.each do |order_detail|#注文詳細保存用
      @order_detail = OrderDetail.new
      #@order_detailOrderDetail.new(item_id: order_detail.item_id, …..)でも大丈夫
      #OrderDetail.new(保存箇所(カラム): 保存したい値(対応するカラム), …..)

      @order_detail.order_id = @order.id#注文ID
      #アソシエーションを組む際は外部キーは必須なので意識する
      @order_detail.item_id = order_detail.item_id#商品ID
      @order_detail.quantity = order_detail.amount#個数
      @order_detail.unit_price = order_detail.item.price#価格(cart_itemモデルに紐づいたitemモデルから価格を取得)

      @order_detail.save!
    end

    @cart_items.destroy_all#カートデータ全削除

    redirect_to thanks_path#購入完了画面へ遷移
  end


  def index
    @orders = current_customer.orders #全注文データ

  end


  def show
    
    @order = Order.find(params[:id])#注文データ取得
    
    @order_details = OrderDetail.where(order_id: params[:id])
    #該当するデータを持つデータの全取得

    #linkでもparamerters飛ばしてるので，link_toで飛ばしてきたidをparams[:id]で使用する
    #idのみだと変数のidを探しに行こうとしてしまい，機能しない
    #Oredr_detailモデル内のorder_idカラムの値の中でindexアクションから渡ってきたidと同じ値を持つデータを取得する．

    @total = 0
    @order_details.each do |order_detail|#商品合計
      @total +=  (order_detail.unit_price * 1.1).floor * order_detail.quantity
    end


  end


  private

    def order_params #メソッド
      params.require(:order).permit(:payment_method, :postal_code, :address, :address_name, :customer_id, :postage, :payment)
      #送られてくるデータで保存する必要があるか無いかでストロングパラメータ内に記述する内容を決める。
      #なので、お届け先のaddress_selectは飛ばす(保存)必要がないため記述しない。ただし，使用は可能なので間違えないように。

      #params.require(:order(フォームで受け取ったインスタンス変数がどこのモデルを介しているか))
      #.permit(:payment_method, :postal_code, :address, :address_name, :customer_id, :postage)で保存する必要のあるを持たせるカラムを入力。
      #ユーザーが入力する値以外が送信しない．例:customer_id
    end




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
