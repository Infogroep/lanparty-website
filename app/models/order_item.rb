class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :store_item

	validates_presence_of :order
	validates_presence_of :store_item
	validates_uniqueness_of :store_item_id, :scope => :order_id
	validates_presence_of :count
	validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0

	def price
		locked_price or unit_price * count
	end

	def unit_price
		store_item.price(order.user)
	end

	def out_of_stock?
		store_item.stock < count
	end

	def decrease_stock!
		store_item.with_lock do
			raise WebsiteErrors::UserFriendlyError.new("Out of stock for item #{store_item.name}") if out_of_stock?

			store_item.stock -= count
			store_item.save!
		end
	end

	def lock_price!
		with_lock do
			self.locked_price = price
			self.save!
		end
	end
end
