class BarcodesController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /barcodes
	# GET /barcodes.json
	def index
		@barcodes = Barcode.all

		respond_to do |format|
			format.html # index.html.erb
		end
	end

	# GET /barcodes/1
	# GET /barcodes/1.json
	def show
		respond_to do |format|
			format.html # show.html.erb
		end
	end

	# GET /barcodes/new
	# GET /barcodes/new.json
	def new
		@barcode = Barcode.new

		respond_to do |format|
			format.html # new.html.erb
		end
	end

	# GET /barcodes/1/edit
	def edit
	end

	# POST /barcodes
	# POST /barcodes.json
	def create
		@barcode = Barcode.new(barcode_params)

		respond_to do |format|
			if @barcode.save
				format.html { redirect_to barcodes_url, flash: { info: 'Barcode was successfully created.' } }
			else
				format.html { render action: "new" }
			end
		end
	end

	# PUT /barcodes/1
	# PUT /barcodes/1.json
	def update
		respond_to do |format|
			if @barcode.update(barcode_params)
				format.html { redirect_to barcodes_url, flash: { info: 'Barcode was successfully updated.' } }
			else
				format.html { render action: "edit" }
			end
		end
	end

	# DELETE /barcodes/1
	# DELETE /barcodes/1.json
	def destroy
		@barcode.destroy

		respond_to do |format|
			format.html { redirect_to barcodes_url }
		end
	end

	private

	def setup_environment
		@barcode = Barcode.find(params[:id])
	end

	def barcode_params
		params.require(:barcode).permit(:code, :store_item_id)
	end
end
