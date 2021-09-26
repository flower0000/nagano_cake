class CustomersController < ApplicationController
  def show
    @customer = current_customer
    #current_で現在ログインしている人の情報をさす(なにモデルでログインしているか)。今回はcustomerモデルを通しているのでcurrent_customerになる。
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find_by(email: current_customer.email)
    customer.update(customer_params)
    redirect_to mypage_path
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

  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
    end


end
