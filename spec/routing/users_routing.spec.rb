require "spec_helper"

describe UsersController do
	describe "routing" do

		it "routes to #index" do
			get("/users").should route_to("user#index")
		end

		it "routes to #new" do
			get("/user/new").should route_to("user#new")
		end

		it "routes to #show" do
			get("/user/1").should route_to("user#show", :id => "1")
		end

		it "routes to #edit" do
			get("/user/1/edit").should route_to("user#edit", :id => "1")
		end

		it "routes to #create" do
			post("/user").should route_to("user#create")
		end

		it "routes to #update" do
			put("/user/1").should route_to("user#update", :id => "1")
		end

		it "routes to #destroy" do
			delete("/user/1").should route_to("user#destroy", :id => "1")
		end

	end
end
