class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_one :cart, dependent: :destroy
  after_create :user_cart

  def user_cart
    Cart.create(user_id: self.id)
  end
||||||| 16ee47c
=======
  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver
  end

>>>>>>> development
end
