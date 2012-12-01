class CreatePricingOverrides < ActiveRecord::Migration
  def change
    create_table :pricing_overrides do |t|
      t.decimal :price
      t.references :store_item
      t.references :pricing_default

      t.timestamps
    end
    add_index :pricing_overrides, :store_item_id
  end
end
