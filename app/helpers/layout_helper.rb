# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#	 helper :layout
module LayoutHelper
	def title(page_title, show_title = true)
		content_for(:title) { h(page_title.to_s) }
		@show_title = show_title
	end

	def show_title?
		@show_title
	end

	def stylesheet(*args)
		content_for(:head) { stylesheet_link_tag(*args) }
	end

	def javascript(*args)
		content_for(:head) { javascript_include_tag(*args) }
	end

	def active_class_path(path)
		resolved = Rails.application.routes.recognize_path(path)
		active_class_action resolved[:controller], resolved[:action]
	end

	def active_class_action(_controller, action)
		if controller.controller_name == _controller.to_s and controller.action_name == (action || controller.action_name).to_s
			"active"
		else
			""
		end
	end

	def navbar_item(text = nil, options = nil, html_options = nil)
		options ||= {}

		path = url_for(options)
		render partial: "layouts/navbar_item", locals: { text: text, path: path, link_options: html_options }
	end

	def navbar_dropdown(text, &content)
		render layout: "layouts/navbar_dropdown", locals: { text: text }, &content
	end
end
