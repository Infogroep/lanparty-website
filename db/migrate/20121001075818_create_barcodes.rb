class CreateBarcodes < ActiveRecord::Migration
	def change
		create_table :barcodes do |t|
			t.string :code
			t.integer :store_item_id

			t.timestamps
		end
	end
end
