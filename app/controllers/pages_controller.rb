class PagesController < ApplicationController

	def home
		@featured_compos = Compo.featured
  end

  def info

  end

  def location

  end

  def contact

  end

  def faq

  end
end
