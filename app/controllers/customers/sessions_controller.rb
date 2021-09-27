# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #退会判別用の記述(ログイン時の退会しているかどうかの確認)
  before_action :reject_customer, only: [:create]#sessions_controllerのcreateアクションを実行するときのみ適用

  protected

  def reject_customer

    @customer = Customer.find_by(email: params[:customer][:email].downcase)#params[:customer][:email]でemailの値を取り出している。

    if @customer#if文に変数名だけが入力されている場合は値が入っていればtrue,なければfalseを返す

      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end

    else
      flash[:error] = "必須項目を入力してください。"
    end

  end

end
