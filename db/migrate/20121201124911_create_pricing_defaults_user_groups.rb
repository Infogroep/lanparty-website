class CreatePricingDefaultsUserGroups < ActiveRecord::Migration
	def change
		create_table :pricing_defaults_user_groups, :id => false do |t|
			t.references :pricing_default
			t.references :user_group
		end
	end
end
