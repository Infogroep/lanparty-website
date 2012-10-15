class CreateGames < ActiveRecord::Migration
	def change
		create_table :games do |t|
			t.string :name
			t.string :info
			t.string :download_location

			t.timestamps
		end
	end
end
