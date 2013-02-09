module OrderItemsHelper
	def add_order_item_action(order,store_item)
		render :partial => "order_items/add_action", :locals => { :order => order, :store_item => store_item }
	end

end
