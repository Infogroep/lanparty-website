class MatchScore < ActiveRecord::Base
	validates_presence_of :match
	validates_presence_of :user
	belongs_to :match
	belongs_to :user
end
