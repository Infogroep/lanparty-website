class CreateClans < ActiveRecord::Migration
	def change
		create_table :clans do |t|
			t.string :tag

			t.timestamps
		end
		change_table :users do |t|
			t.integer :clan_id
		end
	end
end
