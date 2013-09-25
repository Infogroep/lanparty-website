class BlogPost < ActiveRecord::Base
	belongs_to :user
	has_many :blog_comments

	validates_presence_of :content
	validates_presence_of :title
	validates_presence_of :user
end
