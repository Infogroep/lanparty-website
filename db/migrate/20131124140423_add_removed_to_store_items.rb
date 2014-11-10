class AddRemovedToStoreItems < ActiveRecord::Migration
  def change
		add_column :store_items, :removed, :boolean, default: false
  end
end
