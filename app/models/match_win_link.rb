class MatchWinLink < ActiveRecord::Base
	validates_presence_of :match
	validates_presence_of :next_match

	belongs_to :match
	belongs_to :next_match, :class_name => "Match"
end
