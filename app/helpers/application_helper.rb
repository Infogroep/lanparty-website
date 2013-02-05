module ApplicationHelper

	def next_pow_of_2 x
		y=1
		while y < x do
			y*2
		end
		return y
	end

end
