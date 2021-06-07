class Cart < ApplicationRecord
  belongs_to :user
  has_many :joint_items_carts
  has_many :items, through: :joint_items_carts
end
