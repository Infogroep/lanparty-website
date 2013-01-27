class AddPriorityToPricingDefaults < ActiveRecord::Migration
  def change
    add_column :pricing_defaults, :priority, :integer
  end
end
