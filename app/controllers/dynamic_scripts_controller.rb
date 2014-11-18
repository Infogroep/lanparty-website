class DynamicScriptsController < ApplicationController
  skip_before_action :verify_authenticity_token

	def datatables
	end
end