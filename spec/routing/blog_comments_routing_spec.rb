require "spec_helper"

describe BlogCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/blog_comments").should route_to("blog_comments#index")
    end

    it "routes to #new" do
      get("/blog_comments/new").should route_to("blog_comments#new")
    end

    it "routes to #show" do
      get("/blog_comments/1").should route_to("blog_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blog_comments/1/edit").should route_to("blog_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blog_comments").should route_to("blog_comments#create")
    end

    it "routes to #update" do
      put("/blog_comments/1").should route_to("blog_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blog_comments/1").should route_to("blog_comments#destroy", :id => "1")
    end

  end
end
