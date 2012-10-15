require 'spec_helper'

describe "prices/index" do
	before(:each) do
		assign(:prices, [
			stub_model(Price,
				:info => "Info",
				:value => 1.5,
				:sponsor => "Sponsor"
			),
			stub_model(Price,
				:info => "Info",
				:value => 1.5,
				:sponsor => "Sponsor"
			)
		])
	end

	it "renders a list of prices" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => "Info".to_s, :count => 2
		assert_select "tr>td", :text => 1.5.to_s, :count => 2
		assert_select "tr>td", :text => "Sponsor".to_s, :count => 2
	end
end
