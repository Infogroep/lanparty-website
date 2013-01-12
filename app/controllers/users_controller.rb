class UsersController < ApplicationController
	before_filter :login_required, :except => [:new, :create, :index]
  before_filter(:only => [:edit, :update, :destroy]) { params[:id] == self.current_user.id.to_s || access_required(:user_editing) }

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
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update_attributes(params[:user])
			redirect_to users_path, flash:{info: "Your profile has been updated."}
		else
			render :action => 'edit'
		end
	end
end
