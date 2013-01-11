require "spec_helper"

describe ClansController do
  describe "routing" do

    it "routes to #index" do
      get("/clans").should route_to("clans#index")
    end

    it "routes to #new" do
      get("/clans/new").should route_to("clans#new")
    end

    it "routes to #show" do
      get("/clans/1").should route_to("clans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clans/1/edit").should route_to("clans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clans").should route_to("clans#create")
    end

    it "routes to #update" do
      put("/clans/1").should route_to("clans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clans/1").should route_to("clans#destroy", :id => "1")
    end

  end
end
