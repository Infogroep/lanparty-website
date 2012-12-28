namespace :db do
	desc "populates the store items"

	task :populate_store_items, [:amount] => :environment do |t, args|
		require 'lanparty_faker'
		amount = args[:amount].to_i
		puts "-------------------"
		puts "Creating StoreItems"
		puts "-------------------"

		StoreItem.delete_all
		Barcode.delete_all
		barcode_amount = 0
		amount.times do
			store_item = FactoryGirl.create("store_item")
			rand(3)+1.times do
				barcode = FactoryGirl.build("barcode")
				store_item.barcodes << barcode
				barcode.save!
				barcode_amount += 1
			end
			store_item.save!
			puts "created item #{store_item.name}"
		end
		puts "created #{barcode_amount} barcodes"
	end
end
