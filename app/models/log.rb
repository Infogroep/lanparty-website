class Log < ActiveRecord::Base
	attr_accessible :user_id, :message
	belongs_to :user

	validates_presence_of :user
	validates_presence_of :message
end
