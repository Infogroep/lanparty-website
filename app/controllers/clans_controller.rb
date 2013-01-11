class ClansController < ApplicationController
  # GET /clans
  # GET /clans.json
  def index
    @clans = Clan.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clans }
    end
  end

  # GET /clans/1
  # GET /clans/1.json
  def show
    @clan = Clan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clan }
    end
  end

  # GET /clans/new
  # GET /clans/new.json
  def new
    @clan = Clan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clan }
    end
  end

  # GET /clans/1/edit
  def edit
    @clan = Clan.find(params[:id])
  end

  # POST /clans
  # POST /clans.json
  def create
    @clan = Clan.new(params[:clan])

    respond_to do |format|
      if @clan.save
        format.html { redirect_to @clan, notice: 'Clan was successfully created.' }
        format.json { render json: @clan, status: :created, location: @clan }
      else
        format.html { render action: "new" }
        format.json { render json: @clan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clans/1
  # PUT /clans/1.json
  def update
    @clan = Clan.find(params[:id])

    respond_to do |format|
      if @clan.update_attributes(params[:clan])
        format.html { redirect_to @clan, notice: 'Clan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clans/1
  # DELETE /clans/1.json
  def destroy
    @clan = Clan.find(params[:id])
    @clan.destroy

    respond_to do |format|
      format.html { redirect_to clans_url }
      format.json { head :no_content }
    end
  end
end
