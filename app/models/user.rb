class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :cart, dependent: :destroy

  after_create :user_cart
  has_many :order
  has_one_attached :avatar

  def user_cart
    Cart.create(user_id: self.id)
  end

  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
