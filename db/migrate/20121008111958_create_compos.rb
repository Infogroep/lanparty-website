class CreateCompos < ActiveRecord::Migration
	def change
		create_table :compos do |t|
			t.text :description
			t.integer :slots
			t.datetime :date_time
			t.integer :group_size
			t.integer :game_id
			t.boolean :featured, default: false

			t.timestamps
		end
	end
end
