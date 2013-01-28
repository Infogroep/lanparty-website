class CreatePricingOverrides < ActiveRecord::Migration
	def change
		create_table :pricing_overrides do |t|
			t.text :transform
			t.references :payable, :polymorphic => true
			t.references :pricing_default

			t.timestamps
		end
		add_index :pricing_overrides, :payable_id
	end
end
