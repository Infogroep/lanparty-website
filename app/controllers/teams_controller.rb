class TeamsController < ApplicationController
	before_filter :login_required
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	# GET /teams
	# GET /teams.json
	def index
		@teams = Team.all
	end

	# GET /teams/1
	# GET /teams/1.json
	def show
	end

	# GET /teams/new
	# GET /teams/new.json
	def new
		@team = Team.new
		@compo = Compo.find(params[:compo]) if params[:compo]
		@selected_users ||= [current_user.id]
	end

	# GET /teams/1/edit
	def edit
	end

	# POST /teams
	# POST /teams.json
	def create
		@team = Team.new(team_params)
		@selected_users = team_params[:user_ids] if team_params
		@compo = Compo.find(team_params[:compo_id]) if team_params

		if @team.save
			redirect_to @compo, flash: { info: 'Team was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /teams/1
	# PUT /teams/1.json
	def update
		if @team.update(team_params)
			redirect_to teams_url, flash: { info: 'Team was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /teams/1
	# DELETE /teams/1.json
	def destroy
		@team.destroy

		redirect_to teams_url
	end

	private

	def setup_environment
		@team = Team.find(params[:id])
	end

	def team_params
		params.require(:team).permit(:compo_id, :name, user_ids: [])
	end
end
