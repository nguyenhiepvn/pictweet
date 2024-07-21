class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many  :comments   # Association with comments table
  validates :nickname, presence: true,length: { maximum: 6 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: I18n.t('devise.failure.email_invalid') }
end
