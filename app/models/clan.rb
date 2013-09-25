class Clan < ActiveRecord::Base
	validates :tag, presence: true
	has_many :users
end
