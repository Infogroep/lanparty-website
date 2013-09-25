class TeamsController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	before_filter :login_required
	# GET /teams
	# GET /teams.json
	def index
		@teams = Team.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @teams }
		end
	end

	# GET /teams/1
	# GET /teams/1.json
	def show
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @team }
		end
	end

	# GET /teams/new
	# GET /teams/new.json
	def new
		@team = Team.new
		@compo = Compo.find(params[:compo]) if params[:compo]
		@selected_users ||= [current_user.id]

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @team }
		end
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

		respond_to do |format|
			if @team.save
				format.html { redirect_to @compo, flash: { info: 'Team was successfully created.' } }
				format.json { render json: @team, status: :created, location: @team }
			else
				format.html { render action: "new" }
				format.json { render json: @team.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /teams/1
	# PUT /teams/1.json
	def update
		respond_to do |format|
			if @team.update(team_params)
				format.html { redirect_to teams_url, flash: { info: 'Team was successfully updated.' } }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @team.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /teams/1
	# DELETE /teams/1.json
	def destroy
		@team.destroy

		respond_to do |format|
			format.html { redirect_to teams_url }
			format.json { head :no_content }
		end
	end

	private

	def setup_environment
		@team = Team.find(params[:id])
	end

	def team_params
		params.require(:team).permit(:compo_id, :name, :user_ids)
	end
end
