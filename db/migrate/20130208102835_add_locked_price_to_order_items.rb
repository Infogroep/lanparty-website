class AddLockedPriceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :locked_price, :decimal, :precision => 8, :scale => 2
  end
end
