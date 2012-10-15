require "spec_helper"

describe ComposController do
	describe "routing" do

		it "routes to #index" do
			get("/compos").should route_to("compos#index")
		end

		it "routes to #new" do
			get("/compos/new").should route_to("compos#new")
		end

		it "routes to #show" do
			get("/compos/1").should route_to("compos#show", :id => "1")
		end

		it "routes to #edit" do
			get("/compos/1/edit").should route_to("compos#edit", :id => "1")
		end

		it "routes to #create" do
			post("/compos").should route_to("compos#create")
		end

		it "routes to #update" do
			put("/compos/1").should route_to("compos#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/compos/1").should route_to("compos#destroy", :id => "1")
		end

	end
end
