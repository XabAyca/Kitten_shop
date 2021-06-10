class Cart < ApplicationRecord
  belongs_to :user
  has_many :joint_items_carts
  has_many :items, through: :joint_items_carts

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    return total
  end
end
