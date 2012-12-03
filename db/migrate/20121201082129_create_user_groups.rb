class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.references :pricing_override
      t.boolean :allow_group_editing
      t.boolean :allow_store_editing
      t.boolean :allow_stock_editing
      t.boolean :allow_user_editing
      t.boolean :allow_pricing_editing

      t.timestamps
    end
  end
end
