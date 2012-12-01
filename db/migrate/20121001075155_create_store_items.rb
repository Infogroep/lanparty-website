class CreateStoreItems < ActiveRecord::Migration
	def change
		create_table :store_items do |t|
			t.string :name
			t.float :price

			t.timestamps
		end
	end
end
