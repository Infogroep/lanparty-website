class StoreItemClassesController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /store_item_classes
	# GET /store_item_classes.json
	def index
		@store_item_classes = StoreItemClass.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @store_item_classes }
		end
	end

	# GET /store_item_classes/1
	# GET /store_item_classes/1.json
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @store_item_class }
		end
	end

	# GET /store_item_classes/new
	# GET /store_item_classes/new.json
	def new
		@store_item_class = StoreItemClass.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @store_item_class }
		end
	end

	# GET /store_item_classes/1/edit
	def edit
	end

	# POST /store_item_classes
	# POST /store_item_classes.json
	def create
		@store_item_class = StoreItemClass.new(store_item_class_params)

		respond_to do |format|
			if @store_item_class.save
				format.html { redirect_to store_item_classes_url, flash: { info: 'Store item class was successfully created.' } }
				format.json { render json: @store_item_class, status: :created, location: @store_item_class }
			else
				format.html { render action: "new" }
				format.json { render json: @store_item_class.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /store_item_classes/1
	# PUT /store_item_classes/1.json
	def update
		respond_to do |format|
			if @store_item_class.update(store_item_class_params)
				format.html { redirect_to store_item_classes_url, flash: { info: 'Store item class was successfully updated.' } }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @store_item_class.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /store_item_classes/1
	# DELETE /store_item_classes/1.json
	def destroy
		@store_item_class.destroy

		respond_to do |format|
			format.html { redirect_to store_item_classes_url }
			format.json { head :no_content }
		end
	end

	private

	def setup_environment
		@store_item_class = StoreItemClass.find(params[:id])
	end

	def store_item_class_params
		params.require(:store_item_class).permit(:name, :description, :parent_id)
	end
end
