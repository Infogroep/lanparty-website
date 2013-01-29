class AddAccessTypeOrderProcessingToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :access_type_order_processing, :boolean
  end
end
