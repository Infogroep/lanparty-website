require 'spec_helper'

describe "rounds/new" do
	before(:each) do
		assign(:round, stub_model(Round,
			:compo_id => 1
		).as_new_record)
	end

	it "renders new round form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => rounds_path, :method => "post" do
			assert_select "input#round_compo_id", :name => "round[compo_id]"
		end
	end
end
