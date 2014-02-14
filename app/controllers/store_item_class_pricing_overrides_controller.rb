class StoreItemClassPricingOverridesController < ApplicationController
	include PricingOverrideController
	before_filter :login_required
	before_filter { access_required :store_editing }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	# GET /pricing_overrides
	# GET /pricing_overrides.json
	def index
		@pricing_overrides = PricingOverride.where(:payable_type => StoreItemClass.name)

		render :template => 'pricing_overrides/index', :locals => { :new_path_method => :new_store_item_class_pricing_override_path,
			                                                          :edit_path_method => :edit_store_item_class_pricing_override_path,
			                                                          :path_method => :store_item_class_pricing_override_path }
	end

	# GET /pricing_overrides/new
	# GET /pricing_overrides/new.json
	def new
		@pricing_override = PricingOverride.new
		@payable_model = StoreItemClass

		render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_class_pricing_overrides_path }
	end

	# GET /pricing_overrides/1/edit
	def edit
		@payable_model = StoreItemClass

		render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_class_pricing_overrides_path,
			                                                         :instance_path_method => :store_item_class_pricing_override_path }
	end

	# POST /pricing_overrides
	# POST /pricing_overrides.json
	def create
		@pricing_override = PricingOverride.new(pricing_override_params)
		@payable_model = StoreItemClass

		if @pricing_override.save
			redirect_to store_item_class_pricing_overrides_url, flash: { info: 'PricingOverride was successfully created.' }
		else
			render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_class_pricing_overrides_path }
		end
	end

	# PUT /pricing_overrides/1
	# PUT /pricing_overrides/1.json
	def update
		@payable_model = StoreItemClass

		if @pricing_override.update(pricing_override_params)
			redirect_to store_item_class_pricing_overrides_url, flash: { info: 'PricingOverride was successfully updated.' }
		else
			render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_class_pricing_overrides_path }
		end
	end

	# DELETE /pricing_overrides/1
	# DELETE /pricing_overrides/1.json
	def destroy
		@pricing_override.destroy

		redirect_to store_item_class_pricing_overrides_url
	end
end
