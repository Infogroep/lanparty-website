class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :store_item
      t.integer :count

      t.timestamps
    end
    add_index :order_items, :store_item_id
  end
end
