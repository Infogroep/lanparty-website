class OrdersController < ApplicationController
	before_filter :login_required
	before_filter(:only => :new) { access_required(:order_processing) }
	before_filter(:only => :create) { true_required(params[:order][:user_id] == current_user.id.to_s || current_user.access_allowed?(:order_processing)) }
	before_filter(:only => [:show,:destroy]) { user_or_access_required(Order.find(params[:id]).user_id,:order_processing) }
	before_filter(:only => :destroy) { true_required(Order.find(params[:id]).status == :open || current_user.access_allowed?(:order_processing)) }

	# GET /orders
	# GET /orders.json
	def index
		@orders = Order.all

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

		respond_to do |format|
			if @order.save
				format.html { redirect_to @order, notice: 'Order was successfully created.' }
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
end
