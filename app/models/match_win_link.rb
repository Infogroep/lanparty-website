class MatchWinLink < ActiveRecord::Base
	attr_accessible :match_id, :next_match_id

	validates_presence_of :match
	validates_presence_of :next_match

	belongs_to :match
	belongs_to :next_match, :class_name => "Match"
end
