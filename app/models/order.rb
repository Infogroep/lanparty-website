class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :cashier, :class_name => "User"

	has_many :order_items, :dependent => :destroy

	validates_presence_of :user
	validates_presence_of :status_code
	validates_presence_of :placed_at, :if => Proc.new { |order| order.status == :pending }
	validates_presence_of :cashier, :if => Proc.new { |order| order.status == :closed }
	validates_presence_of :payed_at, :if => Proc.new { |order| order.status == :closed }

	def self.status_to_int(status)
		case status
			when :open then 1
			when :pending then 2
			when :closed then 3
			else raise WebsiteErrors::UserFriendlyError("Unknown order status")
		end
	end

	def self.int_to_status(code)
		case code
			when 1 then :open
			when 2 then :pending
			when 3 then :closed
			else raise WebsiteErrors::UserFriendlyError("Unknown order status code")
		end
	end

	scope :open_orders,    where(:status_code => status_to_int(:open))
	scope :pending_orders, where(:status_code => status_to_int(:pending))
	scope :closed_orders,  where(:status_code => status_to_int(:closed))

	def total_price
		order_items.map { |order_item| order_item.price }.reduce(BigDecimal.new("0"),:+)
	end

	def total_item_count
		order_items.map { |order_item| order_item.count }.reduce(0,:+)
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

	def place
		raise WebsiteErrors::UserFriendlyError.new("Can only place open orders") unless status == :open

		self.placed_at = DateTime.current
		self.status = :pending
	end

	def pay(cashier)
		raise WebsiteErrors::UserFriendlyError.new("Can only pay open or pending orders") unless status == :open or status == :pending

		self.with_lock do
			client = user
			client.lock!

			client.account_balance -= self.total_price
			client.save!

			self.order_items.each do |order_item|
				order_item.decrease_stock!
				order_item.lock_price!
			end

			self.cashier = cashier
			self.payed_at = DateTime.current
			self.status = :closed
			self.save!
		end
	end

	def status
		self.class.int_to_status(status_code)
	end

	def status=(status)
		self.status_code = self.class.status_to_int(status)
	end

	private

end
