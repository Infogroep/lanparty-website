class OrdersController < ApplicationController
	include OrdersHelper
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
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

		respond_to do |format|
			format.html # index.html.erb
		end
	end

	# GET /orders/1
	# GET /orders/1.json
	def show
		@order = Order.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
		end
	end

	# GET /orders/new
	# GET /orders/new.json
	def new
		@order = Order.new

		respond_to do |format|
			format.html # new.html.erb
		end
	end

	# POST /orders
	# POST /orders.json
	def create
		@order = Order.new(params[:order])
		@order.status = :open

		respond_to do |format|
			if @order.save
				format.html { redirect_to @order }
			else
				format.html { render action: "new" }
			end
		end
	end

	# DELETE /orders/1
	# DELETE /orders/1.json
	def destroy
		@order = Order.find(params[:id])
		@order.destroy

		respond_to do |format|
			format.html { redirect_to orders_url }
		end
	end

	def place
		@order = Order.find(params[:id])
		@order.place
		respond_to do |format|
			if @order.save
				format.html { redirect_to orders_url, flash: { info: 'Order placed.' } }
			else
				format.html { redirect_to @order, flash: { error: e.message } }
			end
		end
	end

	def pay
		@order = Order.find(params[:id])

		respond_to do |format|
			begin
				@order.pay(current_user)
				format.html { redirect_to orders_url, flash: { info: 'Order payed.' } }
			rescue WebsiteErrors::UserFriendlyError => e
				format.html { redirect_to @order, flash: { error: e.message } }
			end
		end
	end

	private

	def setup_environment
		@order = Order.find(params[:id])
	end

	def barcode_params

	end
end
