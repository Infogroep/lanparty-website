class Sponsor < ActiveRecord::Base
	mount_uploader :image, SponsorUploader

	validates_presence_of :name
	validates_presence_of :website
	validates_uniqueness_of :name
end
