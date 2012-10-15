class CreateMatchWinLinks < ActiveRecord::Migration
	def change
		create_table :match_win_links do |t|
			t.integer :match_id
			t.integer :next_match_id

			t.timestamps
		end
	end
end
