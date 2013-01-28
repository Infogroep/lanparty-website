class OrderItemsController < ApplicationController
	# POST /order/1/order_items
	def create
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
