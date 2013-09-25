class Price < ActiveRecord::Base
	validates_presence_of :value
	validates_presence_of :sponsor

	belongs_to :compo
end
