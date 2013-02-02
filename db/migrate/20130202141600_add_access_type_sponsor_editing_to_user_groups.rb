class AddAccessTypeSponsorEditingToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :access_type_sponsor_editing, :boolean
  end
end
