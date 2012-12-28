class CreateStoreItemClasses < ActiveRecord::Migration
  def change
    create_table :store_item_classes do |t|
      t.string :name
      t.references :parent

      t.timestamps
    end
    add_index :store_item_classes, :parent_id
  end
end
