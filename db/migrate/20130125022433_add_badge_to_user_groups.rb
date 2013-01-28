class AddBadgeToUserGroups < ActiveRecord::Migration
	def change
		add_column :user_groups, :badge, :string
	end
end
