module ApplicationHelper
def active_class(css_class)
		if controller.controller_name == css_class || css_class == "#{controller.controller_name}##{controller.action_name}" || (@nav_tab && @nav_tab == css_class)
			 return "active"
		else
			return ""
		end		
	end
end
