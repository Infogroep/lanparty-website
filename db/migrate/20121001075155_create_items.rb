class CreateItems < ActiveRecord::Migration
	def change
		create_table :items do |t|
			t.string :name
			t.float :buy_price
			t.string :item_type

			t.timestamps
		end
	end
end
