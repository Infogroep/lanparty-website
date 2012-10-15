require "spec_helper"

describe BarcodesController do
	describe "routing" do

		it "routes to #index" do
			get("/barcodes").should route_to("barcodes#index")
		end

		it "routes to #new" do
			get("/barcodes/new").should route_to("barcodes#new")
		end

		it "routes to #show" do
			get("/barcodes/1").should route_to("barcodes#show", :id => "1")
		end

		it "routes to #edit" do
			get("/barcodes/1/edit").should route_to("barcodes#edit", :id => "1")
		end

		it "routes to #create" do
			post("/barcodes").should route_to("barcodes#create")
		end

		it "routes to #update" do
			put("/barcodes/1").should route_to("barcodes#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/barcodes/1").should route_to("barcodes#destroy", :id => "1")
		end

	end
end
