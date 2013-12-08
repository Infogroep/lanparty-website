class UsersController < ApplicationController
	before_filter :login_required, :except => [:new, :create, :index]
	# TODO: Move these checks to strong parameters.
	before_filter(:only => [:create]) { true_required !params[:user].has_key?(:user_group_ids) }
	before_filter(:only => [:update]) { true_required(!params[:user].has_key?(:user_group_ids) || current_user.access_allowed?(:user_editing)) }
	before_filter(:only => [:edit,:update]) { true_required(params[:id] == current_user.id.to_s || current_user.access_allowed?(:user_editing)) }
	before_filter(:only => [:markpayed]) { access_required :user_editing }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all.includes(:teams,:user_groups)
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to pages_signup_finished_url, flash: { info: "Thank you for signing up! You are now logged in." }
		else
			render :action => 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			if user_params[:clan_tag].empty?
				@user.clan = nil
				@user.save
			end
			redirect_to users_url, flash: { info: "Your profile has been updated." }
		else
			render :action => 'edit'
		end
	end

	def markpayed
		@user = User.find_by_structured_message(params[:msg])
		if @user.update({ :payed => true })
			redirect_to users_url, flash: { info: "User has been marked as payed." }
		else
			render :action => 'index'
		end
	end

	private

	def setup_environment
		@user = User.find params[:id]
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_hash, :password_salt, :clan_tag, :payed, :account_balance, :pending_order_sound, user_group_ids: [])
	end
end
