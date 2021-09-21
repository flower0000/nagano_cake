class CustomersController < ApplicationController
  def show
    @customer = current_customer
    #current_で現在ログインしている人の情報をさす(なにモデルでログインしているか)。今回はcustomerモデルを通しているのでcurrent_customerになる。
  end

  def edit

  end

  def update

  end

  def check

  end

  def withdrawal

  end

end
