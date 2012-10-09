require "spec_helper"

describe MatchWinLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/match_win_links").should route_to("match_win_links#index")
    end

    it "routes to #new" do
      get("/match_win_links/new").should route_to("match_win_links#new")
    end

    it "routes to #show" do
      get("/match_win_links/1").should route_to("match_win_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/match_win_links/1/edit").should route_to("match_win_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/match_win_links").should route_to("match_win_links#create")
    end

    it "routes to #update" do
      put("/match_win_links/1").should route_to("match_win_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/match_win_links/1").should route_to("match_win_links#destroy", :id => "1")
    end

  end
end
