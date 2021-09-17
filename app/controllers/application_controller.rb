class ApplicationController < ActionController::Base
  
#deviseのストロングパラメーター設定
 before_action :configure_permitted_parameters, if: :devise_controller?
 
 
 #customer側ログイン後ログアウト後ページ遷移先入力
 
 #admin側ログイン後ログアウト後ページ遷移先入力

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active])
  end
  
  
end
