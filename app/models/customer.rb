class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :cart_items, dependent: :destroy
   has_many :orders, dependent: :destroy

   enum is_active: { kari: true, withdrawal: false }
   #モデルを通した瞬間にenumの変換が入るためdbにはtrueが保存されているが，モデルを経由した瞬間に値が変換されて取り出されるのでkariとして値が返される
   #0がhalseで1がtrueを真偽値として出力される。trueをdbに保存する際は1として保存されるが，取り出すとき(モデル経由前)にboolean型(true)として値が変換される．

  def active_for_authentication?
    super && (self.is_active == "kari")
    #ログインしているユーザーのis_activeの状態がtrueであればkariを値として返す。
  end



end
