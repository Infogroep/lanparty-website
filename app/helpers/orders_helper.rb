module OrdersHelper
	def order_status_color(order)
		case order.status
			when :open then "success"
			when :pending then "warning"
			else ""
		end
	end
end