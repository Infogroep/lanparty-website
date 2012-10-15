class CreateTeamsUsers < ActiveRecord::Migration
	def change
		create_table :teams_users do |t|
			t.references :team, :null => false
			t.references :user, :null => false
		end
	end
end
