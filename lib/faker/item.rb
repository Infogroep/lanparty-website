module Faker
	class Item < Base

		class << self
			def name
				fetch('item.name')
			end
		end
	end
end
