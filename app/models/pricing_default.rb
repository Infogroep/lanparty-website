class PricingDefault < ActiveRecord::Base
	include PricingTransform

	validates_presence_of :transform
	validates_presence_of :name
	validates_presence_of :priority
	validates_uniqueness_of :name

	has_and_belongs_to_many :user_groups
	has_many :pricing_overrides

	def self.find_best_pricing_default(user)
		user.user_groups.map { |group| group.pricing_defaults }.flatten.sort { |pricing1, pricing2| pricing1.priority - pricing2.priority }.first || fallback_default
	end

	def self.fallback_default()
		# TODO: Implement concept of a "fallback default"
		pricingDefault = PricingDefault.find_by name: $SETTINGS[:fallback_pricing_default_name]
		if pricingDefault
			return pricingDefault
		else
			name = $SETTINGS[:fallback_pricing_default_name]
			transform = $SETTINGS[:fallback_pricing_default_transform]
			description = "Price transform used when user does not belong to any group"
			priority = 0
			
			fallbackPricingDefault=PricingDefault.new(
				description:description,
				name:name,
				priority:priority,
				transform:transform
			)
			#save the pricingdefault to the database for future reference.
			fallbackPricingDefault.save!
			return fallbackPricingDefault
		end
	end
end
