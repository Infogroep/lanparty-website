class Order < ActiveRecord::Base
	belongs_to :user

	has_many :order_items, :dependent => :destroy

	validates_presence_of :user

	def total_price
		order_items.map { |order_item| order_item.price(user) }.reduce(:+)
	end

	def scan_item(barcode_str)
		raise WebsiteErrors::BarcodeNotFoundError.new(barcode_str) unless (barcode = Barcode.find_by_code(barcode_str))

		item = barcode.store_item
		existing_order_item = order_items.where(:store_item_id => item.id).first

		if existing_order_item
			existing_order_item.count = existing_order_item.count + 1
			existing_order_item.save
		else
			return false unless (new_order_item = OrderItem.create({ :count => 1, :store_item_id => item.id }))
			order_items.push(new_order_item)
			save
		end
	end
end
