require "spec_helper"

describe BlogCommentsController do
	describe "routing" do

		it "routes to #edit" do
			get("/blog_posts/1/blog_comments/1/edit").should route_to("blog_comments#edit", :blog_post_id => "1", :id => "1")
		end

		it "routes to #create" do
			post("/blog_posts/1/blog_comments").should route_to("blog_comments#create", :blog_post_id => "1")
		end

		it "routes to #update" do
			put("/blog_posts/1/blog_comments/1").should route_to("blog_comments#update", :blog_post_id => "1", :id => "1")
		end

		it "routes to #destroy" do
			delete("/blog_posts/1/blog_comments/1").should route_to("blog_comments#destroy", :blog_post_id => "1", :id => "1")
		end

	end
end
