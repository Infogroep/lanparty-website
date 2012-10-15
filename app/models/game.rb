class Game < ActiveRecord::Base
	attr_accessible :download_location, :info, :name

	validates_presence_of :download_location
	validates_uniqueness_of :download_location
	validates_presence_of :name
	validates_uniqueness_of :name

end
