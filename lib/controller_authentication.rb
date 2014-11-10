# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#	 <% if logged_in? %>
#		 Welcome <%= current_user.username %>.
#		 <%= link_to "Edit profile", edit_current_user_path %> or
#		 <%= link_to "Log out", logout_path %>
#	 <% else %>
#		 <%= link_to "Sign up", signup_path %> or
#		 <%= link_to "log in", login_path %>.
#	 <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#	 before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
	def self.included(controller)
		controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default, :admin_accessible
	end

	def current_user
		@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		current_user
	end

	def login_required
		unless logged_in?
			store_target_location
			redirect_to login_url, flash: { danger: "You must first log in or sign up before accessing this page." }
		end
	end

	def true_required(value)
		referer = request.referer.nil? ? home_url : request.referer
		unless value
			redirect_to referer, flash: { danger: "You are not allowed in this section." }
		end
	end

	def access_required(access_type)
		true_required(current_user.access_allowed?(access_type))
	end

	def user_or_access_required(userid,access_type)
		true_required(userid == current_user.id || current_user.access_allowed?(access_type))
	end

	def redirect_to_target_or_default(default, *args)
		redirect_to(session[:return_to] || default, *args)
		session[:return_to] = nil
	end

	def admin_accessible
		# add access types needed for functions available on the admin page in the array below
		current_user && [:user_editing,:sponsor_editing,:store_editing].any? { |access_type| current_user.access_allowed? access_type }
	end

	private

	def store_target_location
		session[:return_to] = request.url
	end
end
