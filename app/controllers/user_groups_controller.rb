class UserGroupsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	before_filter { access_required :user_editing }

	# GET /user_groups
	# GET /user_groups.json
	def index
		@user_groups = UserGroup.all
	end

	# GET /user_groups/1
	# GET /user_groups/1.json
	def show
	end

	# GET /user_groups/new
	# GET /user_groups/new.json
	def new
		@user_group = UserGroup.new
	end

	# GET /user_groups/1/edit
	def edit
	end

	# POST /user_groups
	# POST /user_groups.json
	def create
		@user_group = UserGroup.new(user_group_params)

		if @user_group.save
			redirect_to user_groups_url, flash: { info: 'User group was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /user_groups/1
	# PUT /user_groups/1.json
	def update
		if @user_group.update(user_group_params)
			redirect_to user_groups_url, flash: { info: 'User group was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /user_groups/1
	# DELETE /user_groups/1.json
	def destroy
		@user_group.destroy

		redirect_to user_groups_url
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
