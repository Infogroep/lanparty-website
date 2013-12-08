module PagesHelper
	def render_markdown md
		raw Tilt['markdown'].new { md }.render
	end
end
