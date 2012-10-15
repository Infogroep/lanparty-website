class MatchLoseLinksController < ApplicationController
	before_filter :login_required
	# GET /match_lose_links
	# GET /match_lose_links.json
	def index
		@match_lose_links = MatchLoseLink.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @match_lose_links }
		end
	end

	# GET /match_lose_links/1
	# GET /match_lose_links/1.json
	def show
		@match_lose_link = MatchLoseLink.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @match_lose_link }
		end
	end

	# GET /match_lose_links/new
	# GET /match_lose_links/new.json
	def new
		@match_lose_link = MatchLoseLink.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @match_lose_link }
		end
	end

	# GET /match_lose_links/1/edit
	def edit
		@match_lose_link = MatchLoseLink.find(params[:id])
	end

	# POST /match_lose_links
	# POST /match_lose_links.json
	def create
		@match_lose_link = MatchLoseLink.new(params[:match_lose_link])

		respond_to do |format|
			if @match_lose_link.save
				format.html { redirect_to @match_lose_link, notice: 'Match lose link was successfully created.' }
				format.json { render json: @match_lose_link, status: :created, location: @match_lose_link }
			else
				format.html { render action: "new" }
				format.json { render json: @match_lose_link.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /match_lose_links/1
	# PUT /match_lose_links/1.json
	def update
		@match_lose_link = MatchLoseLink.find(params[:id])

		respond_to do |format|
			if @match_lose_link.update_attributes(params[:match_lose_link])
				format.html { redirect_to @match_lose_link, notice: 'Match lose link was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @match_lose_link.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /match_lose_links/1
	# DELETE /match_lose_links/1.json
	def destroy
		@match_lose_link = MatchLoseLink.find(params[:id])
		@match_lose_link.destroy

		respond_to do |format|
			format.html { redirect_to match_lose_links_url }
			format.json { head :no_content }
		end
	end
end
