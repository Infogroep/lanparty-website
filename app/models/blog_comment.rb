class BlogComment < ActiveRecord::Base
  belongs_to :blog_post
  belongs_to :user
  attr_accessible :content, :blog_post_id, :user_id
end
