class AddCartToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :carts, index: true, foreign_key: true
  end
end
