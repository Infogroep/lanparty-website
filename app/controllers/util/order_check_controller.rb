module Util
	class OrderCheckController < ApplicationController
		def order_check
			render :partial => 'components/pending_order_message', :status => Order.pending_orders.count == 0 ? :no_content : :ok
		end
	end
end