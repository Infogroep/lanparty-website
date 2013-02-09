module ApplicationHelper
	def standard_edit_buttons(instance, options = {})
		render :partial => "components/standard_edit_controls", :locals => { :instance => instance, :options => options }
	end

	def sound_player(sound, options = {})
		options[:autoplay] ||= false

		render :partial => "components/sound_player", :locals => { :sound => sound, :options => options }
	end
end
