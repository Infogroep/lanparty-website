require 'spec_helper'

describe "rounds/edit" do
	before(:each) do
		@round = assign(:round, stub_model(Round,
			:compo_id => 1
		))
	end

	it "renders the edit round form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => rounds_path(@round), :method => "post" do
			assert_select "input#round_compo_id", :name => "round[compo_id]"
		end
	end
end
