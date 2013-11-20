class SponsorsController < ApplicationController
	before_filter :login_required
	before_filter { access_required :sponsor_editing }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy]

	# GET /sponsors
	# GET /sponsors.json
	def index
		@sponsors = Sponsor.all
	end

	# GET /sponsors/1
	# GET /sponsors/1.json
	def show
	end

	# GET /sponsors/new
	# GET /sponsors/new.json
	def new
		@sponsor = Sponsor.new
	end

	# GET /sponsors/1/edit
	def edit
	end

	# POST /sponsors
	# POST /sponsors.json
	def create
		@sponsor = Sponsor.new(sponsor_params)

		if @sponsor.save
			redirect_to sponsors_url, flash: { info: 'Sponsor was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /sponsors/1
	# PUT /sponsors/1.json
	def update
		if @sponsor.update(sponsor_params)
			redirect_to sponsors_url, flash: { info: 'Sponsor was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /sponsors/1
	# DELETE /sponsors/1.json
	def destroy
		@sponsor.destroy

		redirect_to sponsors_url
	end

	private

	def setup_environment
		@sponsor = Sponsor.find(params[:id])
	end

	def sponsor_params
		params.require(:sponsor).permit(:image, :name, :website)
	end
end
