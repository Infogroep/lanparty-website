require "spec_helper"

describe StoreItemsController do
	describe "routing" do

		it "routes to #index" do
			get("/store_items").should route_to("store_items#index")
		end

		it "routes to #new" do
			get("/store_items/new").should route_to("store_items#new")
		end

		it "routes to #show" do
			get("/store_items/1").should route_to("store_items#show", id: "1")
		end

		it "routes to #edit" do
			get("/store_items/1/edit").should route_to("store_items#edit", id: "1")
		end

		it "routes to #create" do
			post("/store_items").should route_to("store_items#create")
		end

		it "routes to #update" do
			put("/store_items/1").should route_to("store_items#update", id: "1")
		end

		it "routes to #destroy" do
			delete("/store_items/1").should route_to("store_items#destroy", id: "1")
		end

	end
end
