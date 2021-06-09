class RemoveCartsOfUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :carts, index: true, foreign_key: true
  end
end
