class CreateStoreItems < ActiveRecord::Migration
	def change
		create_table :store_items do |t|
			t.string :name
			t.float :purchase_price
      t.integer :stock
			t.references :store_item_class

			t.timestamps
		end
	end
end
