module OrdersHelper
	def order_status_color(order)
		case order.status
			when :open then "success"
			when :pending then "warning"
			else ""
		end
	end

	def order_item_stock_color(order_item)
		order_item.out_of_stock? ? "error" : ""
	end

	def can_modify_order?(order)
		(order.status == :pending && current_user.access_allowed?(:order_processing)) ||
		(order.status == :open && (current_user == order.user || current_user.access_allowed?(:order_processing)))
	end

	def can_place_order?(order)
		order.status == :open && (current_user == order.user || current_user.access_allowed?(:order_processing))
	end

	def can_pay_order?(order)
		order.status != :closed && current_user.access_allowed?(:order_processing)
	end
end