class Order < ApplicationRecord
  validates :user, 
    presence: true

  has_many   :joint_items_orders, dependent: :destroy
  has_many   :items, through: :joint_items_orders
  belongs_to :user
    #after_create :thank_user_order

    def thank_user_order
      ApplicationMailer.thank_user_order(self).deliver
    end
end
