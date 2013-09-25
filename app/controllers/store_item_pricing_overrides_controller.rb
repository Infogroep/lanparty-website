class StoreItemPricingOverridesController < ApplicationController
	include PricingOverrideController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /pricing_overrides
	# GET /pricing_overrides.json
	def index
		@pricing_overrides = PricingOverride.where(:payable_type => StoreItem.name)

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/index', :locals => { :new_path_method => :new_store_item_pricing_override_path,
			                                                                          :edit_path_method => :edit_store_item_pricing_override_path,
			                                                                          :path_method => :store_item_pricing_override_path } }
		end
	end

	# GET /pricing_overrides/new
	# GET /pricing_overrides/new.json
	def new
		@pricing_override = PricingOverride.new
		@payable_model = StoreItem

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_pricing_overrides_path } }
		end
	end

	# GET /pricing_overrides/1/edit
	def edit
		@payable_model = StoreItem

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_pricing_overrides_path,
			                                                                         :instance_path_method => :store_item_pricing_override_path } }
		end
	end

	# POST /pricing_overrides
	# POST /pricing_overrides.json
	def create
		@pricing_override = PricingOverride.new(pricing_override_params)

		respond_to do |format|
			if @pricing_override.save
				format.html { redirect_to store_item_pricing_overrides_url, flash: { info: 'PricingOverride was successfully created.' } }
			else
				format.html { render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_pricing_overrides_path } }
			end
		end
	end

	# PUT /pricing_overrides/1
	# PUT /pricing_overrides/1.json
	def update
		respond_to do |format|
			if @pricing_override.update(pricing_override_params)
				format.html { redirect_to store_item_pricing_overrides_url, flash: { info: 'PricingOverride was successfully updated.' } }
			else
				format.html { render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_pricing_overrides_path } }
			end
		end
	end

	# DELETE /pricing_overrides/1
	# DELETE /pricing_overrides/1.json
	def destroy
		@pricing_override.destroy

		respond_to do |format|
			format.html { redirect_to store_item_pricing_overrides_url }
		end
	end
end
