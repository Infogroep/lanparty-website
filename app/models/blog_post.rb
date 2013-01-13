class BlogPost < ActiveRecord::Base
  belongs_to :user
  has_many :blog_comments
  attr_accessible :content, :title, :user_id
end
