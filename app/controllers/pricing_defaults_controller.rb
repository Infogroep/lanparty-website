class PricingDefaultsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /pricing_defaults
	# GET /pricing_defaults.json
	def index
		@pricing_defaults = PricingDefault.all
	end

	# GET /pricing_defaults/1
	# GET /pricing_defaults/1.json
	def show
	end

	# GET /pricing_defaults/new
	# GET /pricing_defaults/new.json
	def new
		@pricing_default = PricingDefault.new
	end

	# GET /pricing_defaults/1/edit
	def edit
	end

	# POST /pricing_defaults
	# POST /pricing_defaults.json
	def create
		@pricing_default = PricingDefault.new(pricing_default_params)

		if @pricing_default.save
			redirect_to pricing_defaults_url, flash: { info: 'Pricing default was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /pricing_defaults/1
	# PUT /pricing_defaults/1.json
	def update
		if @pricing_default.update(pricing_default_params)
			redirect_to pricing_defaults_url, flash: { info: 'Pricing default was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /pricing_defaults/1
	# DELETE /pricing_defaults/1.json
	def destroy
		@pricing_default.destroy

		redirect_to pricing_defaults_url
	end

	private

	def setup_environment
		@pricing_default = PricingDefault.find(params[:id])
	end

	def pricing_default_params
		params.require(:pricing_default).permit(:transform, :description, :name, :priority, user_group_ids: [])
	end
end
