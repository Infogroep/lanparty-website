class GamesController < ApplicationController
	before_filter :login_required, :except => [:index]
	before_filter(:except => [:index]) { access_required :compo_editing }

	before_action :set_view, only: :index
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	def set_view
		session[:games_view] = (params[:games_view] || session[:games_view] || :grid).to_sym
	end

	# GET /games
	# GET /games.json
	def index
		@games = Game.all
	end

	# GET /games/1
	# GET /games/1.json
	def show
	end

	# GET /games/new
	# GET /games/new.json
	def new
		@game = Game.new
	end

	# GET /games/1/edit
	def edit
	end

	# POST /games
	# POST /games.json
	def create
		@game = Game.new(game_params)

		if @game.save
			redirect_to games_url, flash: { info: 'Game was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /games/1
	# PUT /games/1.json
	def update
		if @game.update(game_params)
			redirect_to games_url, flash: { info: 'Game was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /games/1
	# DELETE /games/1.json
	def destroy
		@game.destroy

		redirect_to games_url
	end

	private

	def setup_environment
		@game = Game.find(params[:id])
	end

	def game_params
		params.require(:game).permit(:download_location, :info, :name, :image)
	end
end
