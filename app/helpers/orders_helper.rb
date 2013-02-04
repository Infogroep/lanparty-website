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
end