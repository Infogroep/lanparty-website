class ChangePurchasePriceTypeToDecimal < ActiveRecord::Migration
  def change
	  change_table :store_items do |t|
		  t.remove :purchase_price
		  t.decimal :purchase_price, precision: 8, scale: 2
	  end
  end
end
