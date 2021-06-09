class Order < ApplicationRecord
  validates :user, 
    presence: true

  has_many   :joint_items_orders, dependent: :destroy
  has_many   :items, through: :joint_items_orders
  belongs_to :user
    after_create :thank_user_order
    after_create :user_order_for_admin

    def thank_user_order
      ApplicationMailer.thank_user_order(self).deliver
    end
    def user_order_for_admin
      ApplicationMailer.user_order_for_admin(self).deliver
    end

    def total 
      total=0
      self.items.each do |item|
        total += item.price
      end
      return total
    end

end
