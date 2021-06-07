class CreateJointItemsCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :joint_items_carts do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
