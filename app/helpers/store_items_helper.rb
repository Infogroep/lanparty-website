module StoreItemsHelper
	def store_items_view_selector_class(toggles_to)
		session[:store_items_view] == toggles_to ? "btn active" : "btn"
	end

	def stock_warning_color(store_item)
		store_item.stock == 0 ? "error" : store_item.stock < 10 ? "warning" : ""
	end
end
