module PricingOverrideController
	private

	def setup_environment
		@pricing_override = PricingOverride.find(params[:id])
	end

	def pricing_override_params
		params.require(:pricing_override).permit(:transform, :pricing_default_id, :payable_id, :payable_type)
	end
end