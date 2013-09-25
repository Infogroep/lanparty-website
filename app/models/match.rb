class Match < ActiveRecord::Base
	validates_presence_of :round

	belongs_to :round
	has_many :match_scores
end
