class UsersController < ApplicationController
	before_filter :login_required, :except => [:new, :create]

	def index
		@users = User.all
	end

	def show
		@nav_tab = 'profile'
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, flash:{info: "Thank you for signing up! You are now logged in."}
		else
			render :action => 'new'
		end
	end

	def edit
		if (self.current_user && self.current_user.access_allowed?(:user_editing))
			@user = User.find params[:id]
		else
			@user = self.current_user
		end
	end

	def update
		@user = current_user
		if @user.update_attributes(params[:user])
			redirect_to root_url, flash:{info: "Your profile has been updated."}
		else
			render :action => 'edit'
		end
	end
end
