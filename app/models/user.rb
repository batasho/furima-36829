class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/,message: "半角英数を両方含む必要があります"}
  validates :first_name, presence: true ,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "全角ひらがな、カタカナ、漢字のみが使えます" }
  validates :last_name, presence: true ,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: "全角ひらがな、カタカナ、漢字のみが使えます" }
  validates :kfirst_name, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナのみが使えます" }
  validates :klast_name, presence: true ,format: { with: /\A[ァ-ヶー－]+\z/,message: "全角カタカナのみが使えます" }
  validates :birthday, presence: true
  #has_many :stocks
  #has_many :purchases
end
