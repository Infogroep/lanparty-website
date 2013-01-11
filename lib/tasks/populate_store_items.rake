namespace :db do
	desc "populates the store items"

	task :populate_store_items, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(:delete => 'true')
		delete = args[:delete] == 'true'
		amount = args[:amount].to_i
		puts "-------------------"
		puts "Creating StoreItems"
		puts "-------------------"

		StoreItem.delete_all
		Barcode.delete_all
		barcode_amount = 0
		taken_item = []
		amount.times do
			store_item = FactoryGirl.create("store_item")
			if taken_item.member? store_item.name
				break
			else
				taken_item << store_item.name
			end
			rand(3)+1.times do
				barcode = FactoryGirl.build("barcode")
				store_item.barcodes << barcode
				barcode.save! if barcode.valid?
				barcode_amount += 1
			end
			store_item.save! if store_item.valid?
			puts "created item #{store_item.name}"
		end
		puts "created #{barcode_amount} barcodes"
	end
end
