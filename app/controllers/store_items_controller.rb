class StoreItemsController < ApplicationController
	before_filter :login_required
	before_filter(:except => [:index,:show]) { access_required :store_editing }

	before_action :set_view, only: :index
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	def set_view
		session[:store_items_view] = (params[:store_items_view] || session[:store_items_view] || :list).to_sym
	end

	# GET /store_items
	# GET /store_items.json
	def index
		@store_items = StoreItem.all
	end

	# GET /store_items/1
	# GET /store_items/1.json
	def show
	end

	# GET /store_items/new
	# GET /store_items/new.json
	def new
		@store_item = StoreItem.new
	end

	# GET /store_items/1/edit
	def edit
	end

	# POST /store_items
	# POST /store_items.json
	def create
		@store_item = StoreItem.new(store_item_params)

		if @store_item.save
			redirect_to store_items_url, flash: { info: 'StoreItem was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /store_items/1
	# PUT /store_items/1.json
	def update
		if @store_item.update(store_item_params)
			redirect_to store_items_url, flash: { info: 'StoreItem was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /store_items/1
	# DELETE /store_items/1.json
	# TODO: URGENT!!! DELETING A STORE ITEM SHOULD EITHER NOT BE POSSIBLE OR ORDER ITEMS SHOULD HANDLE THIS
	def destroy
		@store_item.removed = true
		@store_item.save!

		redirect_to store_items_url
	end

	private

	def setup_environment
		@store_item = StoreItem.find(params[:id])
	end

	def store_item_params
		params.require(:store_item).permit(:purchase_price, :name, :stock, :store_item_class_id)
	end
end
