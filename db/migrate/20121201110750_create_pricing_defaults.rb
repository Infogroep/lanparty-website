class CreatePricingDefaults < ActiveRecord::Migration
  def change
    create_table :pricing_defaults do |t|
      t.string :name
      t.text :description
      t.decimal :rounding_precision, :scale => 2
      t.float :ratio

      t.timestamps
    end
  end
end
