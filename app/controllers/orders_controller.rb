class OrdersController < ApplicationController
	include OrdersHelper
	before_action :setup_environment, only: [:show, :edit, :update, :destroy, :place, :pay]
	before_filter :login_required
	before_filter(:only => :new) { access_required(:order_processing) }
	before_filter(:only => :create) { user_or_access_required(params[:order][:user_id].to_i, :order_processing) }
	before_filter(:only => :show) { user_or_access_required(Order.find(params[:id]).user_id,:order_processing) }
	before_filter(:only => :place) { true_required(can_place_order?(Order.find(params[:id]))) }
	before_filter(:only => :pay) { true_required(can_pay_order?(Order.find(params[:id]))) }
	before_filter(:only => :destroy) { true_required(can_modify_order?(Order.find(params[:id]))) }

	# GET /orders
	# GET /orders.json
	def index
		@orders = Order.order("updated_at DESC").limit(100)
	end

	# GET /orders/1
	# GET /orders/1.json
	def show
	end

	# GET /orders/new
	# GET /orders/new.json
	def new
		@order = Order.new
	end

	# POST /orders
	# POST /orders.json
	def create
		@order = Order.new(order_params)
		@order.status = :open

		if @order.save
			redirect_to @order
		else
			render action: "new"
		end
	end

	# DELETE /orders/1
	# DELETE /orders/1.json
	def destroy
		@order.destroy

		redirect_to orders_url
	end

	def place
		@order.place
		if @order.save
			redirect_to orders_url, flash: { info: 'Order placed.' }
		else
			redirect_to @order, flash: { error: e.message }
		end
	end

	def pay
		begin
			@order.pay(current_user)
			redirect_to orders_url, flash: { info: 'Order payed.' }
		rescue WebsiteErrors::UserFriendlyError => e
			redirect_to @order, flash: { error: e.message }
		end
	end

	private

	def setup_environment
		@order = Order.find(params[:id])
	end

	def order_params
		params.require(:order).permit(:user_id, :placed_at, :payed_at, :status_code)
	end
end
