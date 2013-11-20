class ClansController < ApplicationController
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]
	# GET /clans
	# GET /clans.json
	def index
		@clans = Clan.all
	end

	# GET /clans/1
	# GET /clans/1.json
	def show
	end

	# GET /clans/new
	# GET /clans/new.json
	def new
		@clan = Clan.new
	end

	# GET /clans/1/edit
	def edit
	end

	# POST /clans
	# POST /clans.json
	def create
		@clan = Clan.new(clan_params)

		if @clan.save
			redirect_to clans_url, flash: { info: 'Clan was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /clans/1
	# PUT /clans/1.json
	def update
		if @clan.update(clan_params)
			redirect_to clans_url, flash: { info: 'Clan was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /clans/1
	# DELETE /clans/1.json
	def destroy
		@clan.destroy

		redirect_to clans_url
	end

	private

	def setup_environment
		@clan = Clan.find(params[:id])
	end

	def clan_params
		params.require(:clan).permit(:tag)
	end
end
