class AddPayedBooleanToUsers < ActiveRecord::Migration
  def change
		add_column :users, :payed, :boolean, :default => false
  end
end
