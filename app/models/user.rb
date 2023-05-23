class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates :first_katakana, :last_katakana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字を使用してください' }
  validates :date_of_birth, presence: true
  validates :email, uniqueness: { case_sensitive: true }
end