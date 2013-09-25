class Round < ActiveRecord::Base
	validates_presence_of :compo
	belongs_to :compo
end
