require "spec_helper"

describe MatchLoseLinksController do
	describe "routing" do

		it "routes to #index" do
			get("/match_lose_links").should route_to("match_lose_links#index")
		end

		it "routes to #new" do
			get("/match_lose_links/new").should route_to("match_lose_links#new")
		end

		it "routes to #show" do
			get("/match_lose_links/1").should route_to("match_lose_links#show", :id => "1")
		end

		it "routes to #edit" do
			get("/match_lose_links/1/edit").should route_to("match_lose_links#edit", :id => "1")
		end

		it "routes to #create" do
			post("/match_lose_links").should route_to("match_lose_links#create")
		end

		it "routes to #update" do
			put("/match_lose_links/1").should route_to("match_lose_links#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/match_lose_links/1").should route_to("match_lose_links#destroy", :id => "1")
		end

	end
end
