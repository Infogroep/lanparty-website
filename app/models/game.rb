class Game < ActiveRecord::Base
#	validates_presence_of :download_location
#	validates_uniqueness_of :download_location
	validates_presence_of :name
	validates_uniqueness_of :name

	has_many :compos

	mount_uploader :image, ImageUploader

end
