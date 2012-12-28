module Faker
	class Game < Base

		class << self
			def name
				fetch('game.name')
			end
		end
	end
end
