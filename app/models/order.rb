class Order < ActiveRecord::Base
	attr_accessible :user_id, :placed_at, :processed_at

	belongs_to :user
	belongs_to :cashier, :class_name => "User"

	has_many :order_items, :dependent => :destroy

	validates_presence_of :user
	validates_presence_of :cashier, :if => Proc.new { |order| order.processed? }

	scope :open_orders,    where("placed_at IS NULL AND processed_at IS NULL")
	scope :pending_orders, where("placed_at IS NOT NULL AND processed_at IS NULL")
	scope :closed_orders,  where("processed_at IS NOT NULL")

	def total_price
		order_items.map { |order_item| order_item.price(user) }.reduce(:+)
	end

	def total_item_count
		order_items.map { |order_item| order_item.count }.reduce(:+)
	end

	def add_item(item)
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

	def scan_item(barcode_str)
		raise WebsiteErrors::BarcodeNotFoundError.new(barcode_str) unless (barcode = Barcode.find_by_code(barcode_str))

		add_item(barcode.store_item)
	end

	def add_item_by_id(store_item_id)
		raise WebsiteErrors::UserFriendlyError.new("Store item not found") unless (item = StoreItem.find(store_item_id))

		add_item(item)
	end

	def placed?
		placed_at
	end

	def processed?
		processed_at
	end

	def place
		placed_at = DateTime.current
	end

	def process
		processed_at = DateTime.current
	end

	def status
		!placed? ? :open : !processed? ? :pending : :closed
	end
end
