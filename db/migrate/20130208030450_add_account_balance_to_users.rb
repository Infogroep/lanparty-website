class AddAccountBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_balance, :decimal, :precision => 8, :scale => 2
  end
end
