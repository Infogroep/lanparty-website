class UserGroup < ActiveRecord::Base
	@@access_type_attributes = []

	attr_accessible :description, :name, :badge
	column_names.each do |col|
		if col.start_with?("access_type_")
			s = col.to_sym
			attr_accessible s
			@@access_type_attributes.push(s)
		end
	end

	validates_uniqueness_of :name
	validates_presence_of :name

	has_and_belongs_to_many :users
	has_and_belongs_to_many :pricing_defaults

	mount_uploader :badge, BadgeUploader

	def allows_access?(access_type)
		self.send(:"access_type_#{access_type}") or self.allows_access_transitively?(access_type)
	end

	def self.access_type_attributes()
		@@access_type_attributes
	end

	protected
	@@implied_by = { }

	def self.is_implied_by(one, other)
		if @@implied_by.has_key?(one)
			@@implied_by[one].push(other)
		else
			@@implied_by[one] = [other]
		end
	end

	def self.get_implications(one)
		result = @@implied_by[one]
		return result.nil? ? [] : result
	end

	def self.implies(one, other)
		is_implied_by(other, one)
	end

	def allows_access_transitively?(access_type)
		self.class.get_implications(access_type).any? { |atype| self.allows_access?(atype) }
	end

	# used for testing
	def self.remove_implications
		@@implied_by = {}
	end

	implies :user_editing, :user_detail_viewing
end
