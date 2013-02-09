class StoreItemClassPricingOverridesController < ApplicationController
	before_filter :login_required
	before_filter { access_required :store_editing }

	# GET /pricing_overrides
	# GET /pricing_overrides.json
	def index
		@pricing_overrides = PricingOverride.where(:payable_type => StoreItemClass.name)

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/index', :locals => { :new_path_method => :new_store_item_class_pricing_override_path,
			                                                                          :edit_path_method => :edit_store_item_class_pricing_override_path,
			                                                                          :path_method => :store_item_class_pricing_override_path } }
		end
	end

	# GET /pricing_overrides/new
	# GET /pricing_overrides/new.json
	def new
		@pricing_override = PricingOverride.new
		@payable_model = StoreItemClass

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_class_pricing_overrides_path } }
		end
	end

	# GET /pricing_overrides/1/edit
	def edit
		@pricing_override = PricingOverride.find(params[:id])
		@payable_model = StoreItemClass

		respond_to do |format|
			format.html { render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_class_pricing_overrides_path,
			                                                                         :instance_path_method => :store_item_class_pricing_override_path } }
		end
	end

	# POST /pricing_overrides
	# POST /pricing_overrides.json
	def create
		@pricing_override = PricingOverride.new(params[:pricing_override])

		respond_to do |format|
			if @pricing_override.save
				format.html { redirect_to store_item_class_pricing_overrides_url, flash: { info: 'PricingOverride was successfully created.' } }
			else
				format.html { render :template => 'pricing_overrides/new', :locals => { :path_method => :store_item_class_pricing_overrides_path } }
			end
		end
	end

	# PUT /pricing_overrides/1
	# PUT /pricing_overrides/1.json
	def update
		@pricing_override = PricingOverride.find(params[:id])

		respond_to do |format|
			if @pricing_override.update_attributes(params[:pricing_override])
				format.html { redirect_to store_item_class_pricing_overrides_url, flash: { info: 'PricingOverride was successfully updated.' } }
			else
				format.html { render :template => 'pricing_overrides/edit', :locals => { :path_method => :store_item_class_pricing_overrides_path } }
			end
		end
	end

	# DELETE /pricing_overrides/1
	# DELETE /pricing_overrides/1.json
	def destroy
		@pricing_override = PricingOverride.find(params[:id])
		@pricing_override.destroy

		respond_to do |format|
			format.html { redirect_to store_item_class_pricing_overrides_url }
		end
	end
end
