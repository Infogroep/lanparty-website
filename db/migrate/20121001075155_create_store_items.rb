class CreateStoreItems < ActiveRecord::Migration
	def change
		create_table :store_items do |t|
			t.string :name
			t.float :buy_price
			t.string :store_item_type

			t.timestamps
		end
	end
end
