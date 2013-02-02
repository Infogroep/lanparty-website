class Sponsor < ActiveRecord::Base
	attr_accessible :image, :name, :website

	mount_uploader :image, SponsorUploader

	validates_presence_of :name
	validates_presence_of :website
	validates_uniqueness_of :name
end
