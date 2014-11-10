class Compo < ActiveRecord::Base
	validates_presence_of :date_time
	validates_presence_of :slots
	validates_presence_of :group_size
	validates_presence_of :game
	validates_numericality_of :slots, only_integer: true, greater_than_or_equal_to: 0
	validates_numericality_of :group_size, only_integer: true, greater_than_or_equal_to: 0

	belongs_to :game
	has_many :prices
	has_many :rounds
	has_many :teams

	mount_uploader :participation_badge, BadgeUploader
	mount_uploader :winning_badge, BadgeUploader

	scope :featured, -> { where(featured: true) }

	def has_won?(team)
		#stub
		false
	end

	def name
		return game.name
	end

	def users
		teams.map{|x|x.users}.flatten
	end

	def next_power_of_2 x
		y=1
		while y < x do
			y*=2
		end
		return y
	end

	def bracket_string
		bracket.nil? ? new_bracket : bracket
	end

	def new_bracket
		bracket_type == :tree ? new_tree_bracket : new_list_bracket
	end

	def new_tree_bracket
		teams_amount = teams.count
		bracket_amount = next_power_of_2(teams_amount/2.0)
		bracket = []
		bracket_amount.times do
			bracket.append ["N/A","N/A"]
		end
		tems = teams.dup
		bracket.each do |slot|
			tem = tems.pop
			slot[0] = tem.name if tem
		end
		bracket.each do |slot|
			tem = tems.pop
			slot[1] = tem.name if tem
		end
		return "{\"teams\":#{bracket},\"result\":[]}"
	end

	def new_list_bracket
		tteams = []
		teams.each do |team|
			tteams << [team.name, [0]]
		end
		return "{\"teams\":#{tteams}}"
	end

	def self.int_to_type(code)
		case code
			when 1 then :tree
			when 2 then :list
			else raise WebsiteErrors::UserFriendlyError("Unknown compo type code")
		end
	end

	def self.type_to_int(type)
		case type
			when :tree then 1
			when :list then 2
			else raise WebsiteErrors::UserFriendlyError("Unknown compo type")
		end
	end

	def bracket_type
		self.class.int_to_type(self.bbracket_type)
	end

	def bracket_type=(type)
		self.bracket_type = self.class.type_to_int(type)
	end

end
