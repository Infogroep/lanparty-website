class BlogComment < ActiveRecord::Base
	belongs_to :blog_post
	belongs_to :user

	validates_presence_of :content
	validates_presence_of :blog_post
	validates_presence_of :user
end
