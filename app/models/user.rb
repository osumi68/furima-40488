class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. inputfull-width characters.' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. inputfull-width characters.' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. inputfull-width katakana characters.' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. inputfull-width katakana characters.' }
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  has_many :items
  has_many :orders
  has_many :comments
end
