class MatchScoresController < ApplicationController
	before_filter :login_required
	# GET /match_scores
	# GET /match_scores.json
	def index
		@match_scores = MatchScore.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @match_scores }
		end
	end

	# GET /match_scores/1
	# GET /match_scores/1.json
	def show
		@match_score = MatchScore.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @match_score }
		end
	end

	# GET /match_scores/new
	# GET /match_scores/new.json
	def new
		@match_score = MatchScore.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @match_score }
		end
	end

	# GET /match_scores/1/edit
	def edit
		@match_score = MatchScore.find(params[:id])
	end

	# POST /match_scores
	# POST /match_scores.json
	def create
		@match_score = MatchScore.new(params[:match_score])

		respond_to do |format|
			if @match_score.save
				format.html { redirect_to @match_score, notice: 'Match score was successfully created.' }
				format.json { render json: @match_score, status: :created, location: @match_score }
			else
				format.html { render action: "new" }
				format.json { render json: @match_score.errors, status: :unprocessable_entity }
			end
		end
	end

	# PUT /match_scores/1
	# PUT /match_scores/1.json
	def update
		@match_score = MatchScore.find(params[:id])

		respond_to do |format|
			if @match_score.update_attributes(params[:match_score])
				format.html { redirect_to @match_score, notice: 'Match score was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @match_score.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /match_scores/1
	# DELETE /match_scores/1.json
	def destroy
		@match_score = MatchScore.find(params[:id])
		@match_score.destroy

		respond_to do |format|
			format.html { redirect_to match_scores_url }
			format.json { head :no_content }
		end
	end
end
