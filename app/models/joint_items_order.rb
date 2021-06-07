class JointItemsOrder < ApplicationRecord
  validates :item,
    presence :true
  validates :order,
    presence :true

belongs_to :item
belongs_to :order 

end
