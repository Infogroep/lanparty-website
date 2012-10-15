class Price < ActiveRecord::Base
	attr_accessible :info, :sponsor, :value, :compo_id

	validates_presence_of :value
	validates_presence_of :sponsor

	belongs_to :compo
end
