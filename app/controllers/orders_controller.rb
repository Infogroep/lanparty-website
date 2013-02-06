class OrdersController < ApplicationController
	before_filter :login_required
	before_filter(:only => [:new,:pay]) { access_required(:order_processing) }
	before_filter(:only => :create) { true_required(params[:order][:user_id] == current_user.id.to_s || current_user.access_allowed?(:order_processing)) }
	before_filter(:only => [:show,:destroy,:place]) { user_or_access_required(Order.find(params[:id]).user_id,:order_processing) }
	before_filter(:only => :destroy) do
		order = Order.find(params[:id])
		true_required(order.status == :open || current_user.access_allowed?(:order_processing) && order.status == :pending)
	end

	# GET /orders
	# GET /orders.json
	def index
		@orders = Order.order("created_at DESC").limit(100).order("status_code ASC")

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
				format.html { redirect_to @order, error: "Couldn't place order." }
			end
		end
	end

	def pay
		@order = Order.find(params[:id])
		@order.process(current_user)
		respond_to do |format|
			if @order.save
				format.html { redirect_to orders_url, flash: { info: 'Order payed.' } }
			else
				format.html { redirect_to @order, error: "Couldn't pay order." }
			end
		end
	end
end
