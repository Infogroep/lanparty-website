require 'spec_helper'

describe "rounds/index" do
	before(:each) do
		assign(:rounds, [
			stub_model(Round,
				:compo_id => 1
			),
			stub_model(Round,
				:compo_id => 1
			)
		])
	end

	it "renders a list of rounds" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => 1.to_s, :count => 2
	end
end
