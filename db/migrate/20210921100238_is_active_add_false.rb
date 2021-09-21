class IsActiveAddFalse < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :is_active, to: false
  end
end

#実施している内容はデフォルト値をtrueにしている．記述がエラーっぽいものになっているが結果はそうなっているので注意！
#適用しているマイグレーションファイルを削除する場合はステータスを[up]⇒[down]に変更してからでないと参照しているのに無いという風になってしまうので削除しないように！
#rails db:migrate済み