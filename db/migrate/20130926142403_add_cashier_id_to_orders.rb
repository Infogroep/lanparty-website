class AddCashierIdToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :cashier, index: true
  end
end
