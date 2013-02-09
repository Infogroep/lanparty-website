class RenameProcessedToPayedInOrders < ActiveRecord::Migration
  def change
	  rename_column :orders, :processed_at, :payed_at
  end
end
