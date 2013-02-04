class AddTimestampsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :placed_at, :datetime
    add_column :orders, :processed_at, :datetime
  end
end
