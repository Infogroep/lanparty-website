class PagesController < ApplicationController

	def home
		@nav_tab = 'home'
		@title = "Home"
		@featured_compos = Compo.featured
	end

end
