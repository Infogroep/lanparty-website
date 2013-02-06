class Compo < ActiveRecord::Base
	attr_accessible :date_time, :slots, :match_id, :group_size, :game_id, :featured, :description, :bracket
	validates_presence_of :date_time
	validates_presence_of :slots
	validates_presence_of :group_size
	validates_presence_of :game
	validates_numericality_of :slots, :only_integer => true, :greater_than_or_equal_to => 0
	validates_numericality_of :group_size, :only_integer => true, :greater_than_or_equal_to => 0

	belongs_to :game
	has_many :prices
	has_many :rounds
	has_many :teams

	mount_uploader :participation_badge, BadgeUploader
	mount_uploader :winning_badge, BadgeUploader

	scope :featured, where(featured: true)

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
end

