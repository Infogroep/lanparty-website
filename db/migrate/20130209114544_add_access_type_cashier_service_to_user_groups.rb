class AddAccessTypeCashierServiceToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :access_type_cashier_service, :boolean
  end
end
