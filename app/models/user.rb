class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: "は半角英数字混合で入力してください" }
  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :first_katakana, :last_katakana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
  validates :date_of_birth, presence: true
end