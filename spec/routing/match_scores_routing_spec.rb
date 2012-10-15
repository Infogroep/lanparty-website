require "spec_helper"

describe MatchScoresController do
	describe "routing" do

		it "routes to #index" do
			get("/match_scores").should route_to("match_scores#index")
		end

		it "routes to #new" do
			get("/match_scores/new").should route_to("match_scores#new")
		end

		it "routes to #show" do
			get("/match_scores/1").should route_to("match_scores#show", :id => "1")
		end

		it "routes to #edit" do
			get("/match_scores/1/edit").should route_to("match_scores#edit", :id => "1")
		end

		it "routes to #create" do
			post("/match_scores").should route_to("match_scores#create")
		end

		it "routes to #update" do
			put("/match_scores/1").should route_to("match_scores#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/match_scores/1").should route_to("match_scores#destroy", :id => "1")
		end

	end
end
