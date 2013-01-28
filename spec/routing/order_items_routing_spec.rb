require "spec_helper"

describe OrderItemsController do
	describe "routing" do

		it "routes to #create" do
			post("/orders/1/order_items").should route_to("order_items#create", :order_id => "1")
		end

		it "routes to #update" do
			put("/orders/1/order_items/1").should route_to("order_items#update", :order_id => "1", :id => "1")
		end

		it "routes to #destroy" do
			delete("/orders/1/order_items/1").should route_to("order_items#destroy", :order_id => "1", :id => "1")
		end

	end
end
