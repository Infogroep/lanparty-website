class AddUserDetailViewingToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :user_detail_viewing, :boolean
  end
end
