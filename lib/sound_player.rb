module SoundPlayer
	def sound_player(sound, options = {})
		options[:autoplay] ||= false

		render partial: "components/sound_player", locals: { sound: sound, options: options }
	end
end