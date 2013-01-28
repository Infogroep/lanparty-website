require "spec_helper"

describe StoreItemClassesController do
	describe "routing" do

		it "routes to #index" do
			get("/store_item_classes").should route_to("store_item_classes#index")
		end

		it "routes to #new" do
			get("/store_item_classes/new").should route_to("store_item_classes#new")
		end

		it "routes to #show" do
			get("/store_item_classes/1").should route_to("store_item_classes#show", :id => "1")
		end

		it "routes to #edit" do
			get("/store_item_classes/1/edit").should route_to("store_item_classes#edit", :id => "1")
		end

		it "routes to #create" do
			post("/store_item_classes").should route_to("store_item_classes#create")
		end

		it "routes to #update" do
			put("/store_item_classes/1").should route_to("store_item_classes#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/store_item_classes/1").should route_to("store_item_classes#destroy", :id => "1")
		end

	end
end
