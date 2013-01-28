class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:login], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to_target_or_default home_url, flash: { info: "Logged in successfully." }
		else
			flash.now[:alert] = "Invalid login or password."
			render :action => 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to home_url, flash: { info: "You have been logged out." }
	end
end
