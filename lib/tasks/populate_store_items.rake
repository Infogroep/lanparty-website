namespace :db do
	desc "populates the store items"

	task :populate_store_items, [:amount] => :environment do |t, args|
		require 'lanparty_faker'
		amount = args[:amount].to_i
		puts "--------------"
		puts "Creating StoreItems"
		puts "--------------"

		StoreItem.delete_all
		Barcode.delete_all
		amount.times do
			store_item = FactoryGirl.create("store_item")
			rand(3).times do
				barcode = FactoryGirl.build("barcode")
				store_item.barcodes << barcode
				barcode.save!
			end
			store_item.save!
		end
	end
end
