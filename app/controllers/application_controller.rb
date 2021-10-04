class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)#サインインする前にここを実行してください．(resource)でログインする人の情報を取得．
    #p resource ここの記述で中身を知れるメソッド
    case resource
    when Admin
      admin_root_path#pathは設定したい遷移先へのpathを指定(resourceの中身がAdminならここに遷移)
    when Customer
      root_path#ここもpathはご自由に変更可能(Customerならこっちに遷移)
    end
  #ここでいうAdminとCustomerはモデル

  end

  def after_sign_out_path_for(resource)
    #p resource ここの記述で中身を知れるメソッド
    case resource
    when :admin
      new_admin_session_path#pathは設定したい遷移先へのpathを指定(resourceの中身がAdminならここに遷移)
    when :customer
      root_path#ここもpathはご自由に変更可能(Customerならこっちに遷移)
    end
  end


  #リソースの中身に入っている値を見て，条件式に記述する内容を決めてあげる


  #deviseのストロングパラメーター設定
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    #サインアップするときに送信するデータで，送信を許可する項目をkeysで指定
    #サインイン時にもemailとパスワード以外にデータを送信する必要があれば記載する
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:])　こんな感じ．同じアクション内に記述
  end


end
