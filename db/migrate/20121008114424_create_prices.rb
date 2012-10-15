class CreatePrices < ActiveRecord::Migration
	def change
		create_table :prices do |t|
			t.string :info
			t.float :value
			t.string :sponsor
			t.integer :compo_id

			t.timestamps
		end
	end
end
