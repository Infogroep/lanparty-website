class UsersController < ApplicationController
	before_filter :login_required, :except => [:new, :create, :index]
	before_filter(:only => [:create]) { true_required !params[:user].has_key?(:user_group_ids) }
	before_filter(:only => [:update]) { true_required(!params[:user].has_key?(:user_group_ids) || current_user.access_allowed?(:user_editing)) }
	before_filter(:only => [:edit,:update]) { true_required(params[:id] == current_user.id.to_s || current_user.access_allowed?(:user_editing)) }
	before_filter(:only => [:markpayed]) { access_required :user_editing }

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
			redirect_to signup_finished_url, flash: { info: "Thank you for signing up! You are now logged in." }
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
			redirect_to users_url, flash: { info: "Your profile has been updated." }
		else
			render :action => 'edit'
		end
	end

	def markpayed
		@user = User.find_by_structured_message(params[:msg])
		if @user.update_attributes({ :payed => true })
			redirect_to users_url, flash: { info: "User has been marked as payed." }
		else
			render :action => 'index'
		end
	end
end