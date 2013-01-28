module StoreItemsHelper
	def view_selector_class(toggles_to)
		session[:store_items_view] == toggles_to ? "btn active" : "btn"
	end
end
