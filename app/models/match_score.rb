class MatchScore < ActiveRecord::Base
	attr_accessible :match_id, :score, :user_id

	validates_presence_of :match
	validates_presence_of :user
	belongs_to :match
	belongs_to :user
end
