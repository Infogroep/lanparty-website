class PagesController < ApplicationController

	def home
		@nav_tab = 'home'
		@title = "Home"
	end

end
