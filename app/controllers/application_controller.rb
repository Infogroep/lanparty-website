class ApplicationController < ActionController::Base
	include ControllerAuthentication
	include SoundPlayer
	protect_from_forgery with: :exception

	before_filter :set_locale

	def set_locale
		I18n.locale = params[:locale] || :nl
	end

	def default_url_options(options={ })
		logger.debug "default_url_options is passed options: #{options.inspect}\n"
		{ :locale => I18n.locale }
	end
end
