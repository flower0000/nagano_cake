class CustomersController < ApplicationController
  def show
    @customer = current_customer
    #current_で現在ログインしている人の情報をさす(なにモデルでログインしているか)。今回はcustomerモデルを通しているのでcurrent_customerになる。
  end

  def edit
    @customer = current_customer
  end

  def update

  end

  def check

  end

  def withdrawal
    @customer = current_customer
    @user.update(is_active: false)
    #is_activeカラムの値を変更(defaultはtrueに設定)
    reset_session
    #ログアウトさせる(強制的にログアウト)
    redirect_to root_path
  end

end
