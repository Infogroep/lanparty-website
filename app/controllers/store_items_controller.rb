class StoreItemsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter(:except => [:index,:show]) { access_required :store_editing }

	before_filter :set_view, :only => :index

	def set_view
		session[:store_items_view] = (params[:store_items_view] || session[:store_items_view] || :list).to_sym
	end

	# GET /store_items
	# GET /store_items.json
	def index
		@store_items = StoreItem.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @store_items }
		end
	end

	# GET /store_items/1
	# GET /store_items/1.json
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @store_item }
		end
	end

	# GET /store_items/new
	# GET /store_items/new.json
	def new
		@store_item = StoreItem.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @store_item }
		end
	end

	# GET /store_items/1/edit
	def edit
	end

	# POST /store_items
	# POST /store_items.json
	def create
		@store_item = StoreItem.new(store_item_params)

		respond_to do |format|
			if @store_item.save
				format.html { redirect_to store_items_url, flash: { info: 'StoreItem was successfully created.' } }
				format.json { render json: store_items_url, status: :created, location: @store_item }
			else
				format.html { render action: "new" }
				format.json { render json: @store_item.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /store_items/1
	# PUT /store_items/1.json
	def update
		respond_to do |format|
			if @store_item.update(store_item_params)
				format.html { redirect_to store_items_url, flash: { info: 'StoreItem was successfully updated.' } }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @store_item.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /store_items/1
	# DELETE /store_items/1.json
	# TODO: URGENT!!! DELETING A STORE ITEM SHOULD EITHER NOT BE POSSIBLE OR ORDER ITEMS SHOULD HANDLE THIS
	def destroy
		@store_item.destroy

		respond_to do |format|
			format.html { redirect_to store_items_url }
			format.json { head :no_content }
		end
	end

	private

	def setup_environment
		@store_item = StoreItem.find(params[:id])
	end

	def store_item_params
		params.require(:store_item).permit(:purchase_price, :name, :stock, :store_item_class_id)
	end
end
