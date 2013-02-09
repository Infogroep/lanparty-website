class AddPendingOrderSoundToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending_order_sound, :string
  end
end
