class StoreItemClassesController < ApplicationController
	before_filter :login_required
	before_filter { access_required :store_editing }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	# GET /store_item_classes
	# GET /store_item_classes.json
	def index
		@store_item_classes = StoreItemClass.all
	end

	# GET /store_item_classes/1
	# GET /store_item_classes/1.json
	def show
	end

	# GET /store_item_classes/new
	# GET /store_item_classes/new.json
	def new
		@store_item_class = StoreItemClass.new
	end

	# GET /store_item_classes/1/edit
	def edit
	end

	# POST /store_item_classes
	# POST /store_item_classes.json
	def create
		@store_item_class = StoreItemClass.new(store_item_class_params)

		if @store_item_class.save
			redirect_to store_item_classes_url, flash: { info: 'Store item class was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /store_item_classes/1
	# PUT /store_item_classes/1.json
	def update
		if @store_item_class.update(store_item_class_params)
			redirect_to store_item_classes_url, flash: { info: 'Store item class was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /store_item_classes/1
	# DELETE /store_item_classes/1.json
	def destroy
		@store_item_class.destroy

		redirect_to store_item_classes_url
	end

	private

	def setup_environment
		@store_item_class = StoreItemClass.find(params[:id])
	end

	def store_item_class_params
		params.require(:store_item_class).permit(:name, :description, :parent_id)
	end
end
