class MatchWinLinksController < ApplicationController
  # GET /match_win_links
  # GET /match_win_links.json
  def index
    @match_win_links = MatchWinLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_win_links }
    end
  end

  # GET /match_win_links/1
  # GET /match_win_links/1.json
  def show
    @match_win_link = MatchWinLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match_win_link }
    end
  end

  # GET /match_win_links/new
  # GET /match_win_links/new.json
  def new
    @match_win_link = MatchWinLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match_win_link }
    end
  end

  # GET /match_win_links/1/edit
  def edit
    @match_win_link = MatchWinLink.find(params[:id])
  end

  # POST /match_win_links
  # POST /match_win_links.json
  def create
    @match_win_link = MatchWinLink.new(params[:match_win_link])

    respond_to do |format|
      if @match_win_link.save
        format.html { redirect_to @match_win_link, notice: 'Match win link was successfully created.' }
        format.json { render json: @match_win_link, status: :created, location: @match_win_link }
      else
        format.html { render action: "new" }
        format.json { render json: @match_win_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /match_win_links/1
  # PUT /match_win_links/1.json
  def update
    @match_win_link = MatchWinLink.find(params[:id])

    respond_to do |format|
      if @match_win_link.update_attributes(params[:match_win_link])
        format.html { redirect_to @match_win_link, notice: 'Match win link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match_win_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_win_links/1
  # DELETE /match_win_links/1.json
  def destroy
    @match_win_link = MatchWinLink.find(params[:id])
    @match_win_link.destroy

    respond_to do |format|
      format.html { redirect_to match_win_links_url }
      format.json { head :no_content }
    end
  end
end
