class UserGroupsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :user_editing }

	# GET /user_groups
	# GET /user_groups.json
	def index
		@user_groups = UserGroup.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @user_groups }
		end
	end

	# GET /user_groups/1
	# GET /user_groups/1.json
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @user_group }
		end
	end

	# GET /user_groups/new
	# GET /user_groups/new.json
	def new
		@user_group = UserGroup.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user_group }
		end
	end

	# GET /user_groups/1/edit
	def edit
	end

	# POST /user_groups
	# POST /user_groups.json
	def create
		@user_group = UserGroup.new(user_group_params)

		respond_to do |format|
			if @user_group.save
				format.html { redirect_to user_groups_url, flash: { info: 'User group was successfully created.' } }
				format.json { render json: @user_group, status: :created, location: @user_group }
			else
				format.html { render action: "new" }
				format.json { render json: @user_group.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /user_groups/1
	# PUT /user_groups/1.json
	def update
		respond_to do |format|
			if @user_group.update(user_group_params)
				format.html { redirect_to user_groups_url, flash: { info: 'User group was successfully updated.' } }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @user_group.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /user_groups/1
	# DELETE /user_groups/1.json
	def destroy
		@user_group.destroy

		respond_to do |format|
			format.html { redirect_to user_groups_url }
			format.json { head :no_content }
		end
	end

	private

	def setup_environment
		@user_group = UserGroup.find(params[:id])
	end

	def user_group_params
		# TODO: Should do real permission checking. Not doing this now because i need column info
		# params.require(:user_group).permit(:description, :name, :badge, ...access type columns)
		params.require(:user_group).permit()
	end
end
