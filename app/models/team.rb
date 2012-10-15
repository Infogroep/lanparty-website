class Team < ActiveRecord::Base
  attr_accessible :compo_id, :name

	validates_presence_of :name
	validates_presence_of :compo

	belongs_to :compo
	has_and_belongs_to_many :users
end
