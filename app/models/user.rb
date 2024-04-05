class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # メールアドレスは、@を含む必要があること
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効な形式で入力してください' }
  # パスワードが必須であり、6文字以上での入力が必須であること
  # パスワードは、半角英数字混合での入力が必須であること
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
  # パスワードとパスワード（確認）は、値の一致が必須であること
  validates :password_confirmation, presence: true, on: :create

end
