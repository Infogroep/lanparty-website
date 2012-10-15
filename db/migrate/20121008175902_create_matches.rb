class CreateMatches < ActiveRecord::Migration
	def change
		create_table :matches do |t|
			t.integer :round_id

			t.timestamps
		end
	end
end
