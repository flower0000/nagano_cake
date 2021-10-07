class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :cart_items, dependent: :destroy
   has_many :orders, dependent: :destroy

   #こういう書き方もできるよ
   #enum is_active: { kari: true, withdrawal: false }
   #モデルを通した瞬間にenumの変換が入るためdbにはtrueが保存されているが，モデルを経由した瞬間に値が変換されて取り出されるのでkariとして値が返される
   #0がhalseで1がtrueを真偽値として出力される。trueをdbに保存する際は1として保存されるが，取り出すとき(モデル経由前)にboolean型(true)として値が変換される．

  def active_for_authentication?#メソッドで、？を使用すると返す値をboolean型で返しますよという意思表示
    super && self.is_active
  #super:親クラス(ApplicationRecord「devise」)にactive_for_authentication?メソッドがないかを探しに行く。あれば実行。

  end



end
