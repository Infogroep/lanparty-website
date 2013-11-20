class OrderItemsController < ApplicationController
	include OrdersHelper
	before_filter :login_required
	before_filter { true_required(can_modify_order?(Order.find(params[:order_id]))) }

	before_action :set_view, only: :new
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	def set_view
		session[:store_items_view] = (params[:store_items_view] || session[:store_items_view] || :list).to_sym
	end

	# POST /order/1/order_items/scan
	def scan
		@order = Order.find(params[:order_id])

		begin
			raise WebsiteErrors::UserFriendlyError.new("Couldn't create order entry.") unless @order.scan_item(params[:barcode])
			render :partial => "orders/order_items", :locals => { :order => @order }
		rescue WebsiteErrors::UserFriendlyError => e
			flash.now[:danger] = e.message
			render :partial => "layouts/flash_messages", :status => 500
		end
	end

	# POST /order/1/order_items/add
	def add
		@order = Order.find(params[:order_id])

		begin
			raise WebsiteErrors::UserFriendlyError.new("Couldn't create order entry.") unless @order.add_item_by_id(params[:store_item_id])
			redirect_to @order
		rescue WebsiteErrors::UserFriendlyError => e
			redirect_to @order, flash: { danger: e.message }
		end
	end

	def new
		@order = Order.find(params[:order_id])
		@store_items = StoreItem.all
	end

	# PUT /order/1/order_items/1
	def update
		begin
			raise WebsiteErrors::UserFriendlyError.new("Couldn't update order entry.") unless @order_item.update(order_item_params)
			render :partial => "orders/order_items", :locals => { :order => @order }
		rescue WebsiteErrors::UserFriendlyError => e
			flash.now[:danger] = e.message
			render :partial => "layouts/flash_messages", :status => 500
		end
	end

	# DELETE /order/1/order_items/1
	def destroy
		@order_item.destroy

		render :partial => "orders/order_items", :locals => { :order => @order }
	end

	private

	def setup_environment
		@order = Order.find(params[:order_id])
		@order_item = OrderItem.find(params[:id])
	end

	def order_item_params
		params.require(:order_item).permit(:count, :order_id, :store_item_id, :locked_price)
	end
end
