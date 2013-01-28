class PricingDefaultsController < ApplicationController
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /pricing_defaults
	# GET /pricing_defaults.json
	def index
		@pricing_defaults = PricingDefault.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @pricing_defaults }
		end
	end

	# GET /pricing_defaults/1
	# GET /pricing_defaults/1.json
	def show
		@pricing_default = PricingDefault.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @pricing_default }
		end
	end

	# GET /pricing_defaults/new
	# GET /pricing_defaults/new.json
	def new
		@pricing_default = PricingDefault.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @pricing_default }
		end
	end

	# GET /pricing_defaults/1/edit
	def edit
		@pricing_default = PricingDefault.find(params[:id])
	end

	# POST /pricing_defaults
	# POST /pricing_defaults.json
	def create
		@pricing_default = PricingDefault.new(params[:pricing_default])

		respond_to do |format|
			if @pricing_default.save
				format.html { redirect_to @pricing_default, flash: { info: 'Pricing default was successfully created.' } }
				format.json { render json: @pricing_default, status: :created, location: @pricing_default }
			else
				format.html { render action: "new" }
				format.json { render json: @pricing_default.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /pricing_defaults/1
	# PUT /pricing_defaults/1.json
	def update
		@pricing_default = PricingDefault.find(params[:id])

		respond_to do |format|
			if @pricing_default.update_attributes(params[:pricing_default])
				format.html { redirect_to @pricing_default, flash: { info: 'Pricing default was successfully updated.' } }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @pricing_default.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /pricing_defaults/1
	# DELETE /pricing_defaults/1.json
	def destroy
		@pricing_default = PricingDefault.find(params[:id])
		@pricing_default.destroy

		respond_to do |format|
			format.html { redirect_to pricing_defaults_url }
			format.json { head :no_content }
		end
	end
end
