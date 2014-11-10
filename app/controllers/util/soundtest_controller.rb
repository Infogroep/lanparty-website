module Util
	class SoundtestController < ApplicationController
		def soundtest
			sound_player(User.build_sound_info(params[:sound]), autoplay: true)
		end
	end
end