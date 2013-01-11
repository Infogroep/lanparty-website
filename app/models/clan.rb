class Clan < ActiveRecord::Base
  attr_accessible :tag
	validates :tag, presence: true
	has_many :users
end
