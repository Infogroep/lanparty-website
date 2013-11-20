class ComposController < ApplicationController
	before_filter :login_required
	before_filter(:except => [:index, :show]) { access_required :compo_editing }
	before_action :setup_environment, only: [:show, :edit, :update, :destroy, :save_bracket]

	# GET /compos
	# GET /compos.json
	def index
		@compos = Compo.all
	end

	# GET /compos/1
	# GET /compos/1.json
	def show
	end

	# GET /compos/new
	# GET /compos/new.json
	def new
		@compo = Compo.new
	end

	# GET /compos/1/edit
	def edit
	end

	# POST /compos
	# POST /compos.json
	def create
		@compo = Compo.new(compo_params)

		if @compo.save
			redirect_to compos_url, flash: { info: 'Compo was successfully created.' }
		else
			render action: "new"
		end
	end

	# PUT /compos/1
	# PUT /compos/1.json
	def update
		if @compo.update(compo_params)
			redirect_to compos_url, flash: { info: 'Compo was successfully updated.' }
		else
			render action: "edit"
		end
	end

	# DELETE /compos/1
	# DELETE /compos/1.json
	def destroy
		@compo.destroy

		redirect_to compos_url
	end

	def save_bracket
		@bracket_string = params[:compo][:bracket_string]
		@compo.bracket = @bracket_string
		@compo.save

		redirect_to @compo, flash: {info:"saved"}
	end

	private

	def setup_environment
		@compo = Compo.find(params[:id])
	end

	def compo_params
		params.require(:compo).permit(:date_time, :slots, :match_id, :group_size, :game_id, :featured, :description, :bracket, :bbracket_type)
	end
end
