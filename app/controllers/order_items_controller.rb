class OrderItemsController < ApplicationController
	before_filter :login_required
	before_filter { user_or_access_required(Order.find(params[:order_id]).user_id,:order_processing) }
	before_filter { true_required(Order.find(params[:order_id]).status == :open || current_user.access_allowed?(:order_processing)) }

	before_filter :set_view, :only => :new

	def set_view
		session[:store_items_view] = (params[:store_items_view] || session[:store_items_view] || :list).to_sym
	end

	# POST /order/1/order_items/scan
	def scan
		@order = Order.find(params[:order_id])

		respond_to do |format|
			begin
				raise WebsiteErrors::UserFriendlyError.new("Couldn't create order entry.") unless @order.scan_item(params[:barcode])
				format.html { render :partial => "orders/order_items", :locals => { :order => @order } }
			rescue WebsiteErrors::UserFriendlyError => e
				format.html do
					flash.now[:error] = e.message
					render :partial => "layouts/flash_messages", :status => 500
				end
			end
		end
	end

	# POST /order/1/order_items/add
	def add
		@order = Order.find(params[:order_id])

		respond_to do |format|
			begin
				raise WebsiteErrors::UserFriendlyError.new("Couldn't create order entry.") unless @order.add_item_by_id(params[:store_item_id])
				format.html { redirect_to @order }
			rescue WebsiteErrors::UserFriendlyError => e
				format.html { redirect_to @order, flash: { error: e.message } }
			end
		end
	end

	def new
		@order = Order.find(params[:order_id])
		@store_items = StoreItem.all

		respond_to do |format|
			format.html # new.html.erb
		end
	end

	# PUT /order/1/order_items/1
	def update
		@order = Order.find(params[:order_id])
		@order_item = OrderItem.find(params[:id])

		respond_to do |format|
			begin
				raise WebsiteErrors::UserFriendlyError.new("Couldn't update order entry.") unless @order_item.update_attributes(params[:order_item])
				format.html { render :partial => "orders/order_items", :locals => { :order => @order } }
			rescue WebsiteErrors::UserFriendlyError => e
				format.html do
					flash.now[:error] = e.message
					render :partial => "layouts/flash_messages", :status => 500
				end
			end
		end
	end

	# DELETE /order/1/order_items/1
	def destroy
		@order = Order.find(params[:order_id])
		@order_item = OrderItem.find(params[:id])
		@order_item.destroy

		respond_to do |format|
			format.html { render :partial => "orders/order_items", :locals => { :order => @order } }
		end
	end
end
