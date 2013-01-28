class CreatePricingDefaults < ActiveRecord::Migration
	def change
		create_table :pricing_defaults do |t|
			t.string :name
			t.text :description
			t.text :transform

			t.timestamps
		end
	end
end
