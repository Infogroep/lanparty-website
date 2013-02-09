require 'bigdecimal'

module PricingTransform

	def p(price)
		BigDecimal.new(price)
	end

	def apply_transform(oprice, cprice)
		eval(self.transform)
	end
end