class CreateMatchScores < ActiveRecord::Migration
	def change
		create_table :match_scores do |t|
			t.integer :match_id
			t.integer :user_id
			t.integer :score

			t.timestamps
		end
	end
end
