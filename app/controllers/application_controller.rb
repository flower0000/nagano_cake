class ApplicationController < ActionController::Base

#deviseのストロングパラメーター設定
 before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)#サインインする前にここを実行してください．(resource)でログインする人の情報を取得．

    case resource
    when Admin
      admin_path#pathは設定したい遷移先へのpathを指定(resourceの中身がAdminならここに遷移)
    when Customer
      mypage_path#ここもpathはご自由に変更可能(Customerならこっちに遷移)
    end

  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active])
    #サインアップするときに送信するデータで，送信を許可する項目をkeysで指定
    #サインイン時にもemailとパスワード以外にデータを送信する必要があれば記載する
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:])　こんな感じ．同じアクション内に記述
  end


end
