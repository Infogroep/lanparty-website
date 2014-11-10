class CreateUserGroupsUsers < ActiveRecord::Migration
	def change
		create_table :user_groups_users, id: false do |t|
			t.references :user_group
			t.references :user
		end
	end
end
