module ApplicationHelper
	def standard_edit_buttons(instance, options = {})
		render :partial => "components/standard_edit_controls", :locals => { :instance => instance, :options => options }
	end
end
