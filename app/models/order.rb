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

    def total 
      total=0
      self.items.each do |item|
        total += item.price
      end
      return total
    end

end
