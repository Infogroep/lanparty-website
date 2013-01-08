module Faker
	class Team < Base
		class << self
			def name
				fetch('team.name')
			end
		end
	end
end
