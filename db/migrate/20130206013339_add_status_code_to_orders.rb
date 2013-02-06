class AddStatusCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status_code, :integer
  end
end
