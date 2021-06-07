class Cart < ApplicationRecord
  belongs_to :users
  has_many :items, through: :joint_items_carts
end
