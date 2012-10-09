require "spec_helper"

describe PricesController do
  describe "routing" do

    it "routes to #index" do
      get("/prices").should route_to("prices#index")
    end

    it "routes to #new" do
      get("/prices/new").should route_to("prices#new")
    end

    it "routes to #show" do
      get("/prices/1").should route_to("prices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prices/1/edit").should route_to("prices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prices").should route_to("prices#create")
    end

    it "routes to #update" do
      put("/prices/1").should route_to("prices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prices/1").should route_to("prices#destroy", :id => "1")
    end

  end
end
