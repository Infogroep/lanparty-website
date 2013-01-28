require "spec_helper"

describe PricingDefaultsController do
	describe "routing" do

		it "routes to #index" do
			get("/pricing_defaults").should route_to("pricing_defaults#index")
		end

		it "routes to #new" do
			get("/pricing_defaults/new").should route_to("pricing_defaults#new")
		end

		it "routes to #show" do
			get("/pricing_defaults/1").should route_to("pricing_defaults#show", :id => "1")
		end

		it "routes to #edit" do
			get("/pricing_defaults/1/edit").should route_to("pricing_defaults#edit", :id => "1")
		end

		it "routes to #create" do
			post("/pricing_defaults").should route_to("pricing_defaults#create")
		end

		it "routes to #update" do
			put("/pricing_defaults/1").should route_to("pricing_defaults#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/pricing_defaults/1").should route_to("pricing_defaults#destroy", :id => "1")
		end

	end
end
