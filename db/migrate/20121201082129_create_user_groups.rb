class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.references :pricing_override
      t.boolean :store_editing
      t.boolean :user_editing
      t.boolean :blog_editing

      t.timestamps
    end
  end
end
