class CreateJointItemsOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :joint_items_orders do |t|
      t.references :item, index: true
      t.references :order, index: true

      t.timestamps
    end
  end
end
