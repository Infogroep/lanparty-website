require 'spec_helper'

describe "games/index" do
	before(:each) do
		assign(:games, [
			stub_model(Game,
				:name => "Name",
				:info => "Info",
				:download_location => "Download Location"
			),
			stub_model(Game,
				:name => "Name",
				:info => "Info",
				:download_location => "Download Location"
			)
		])
	end

	it "renders a list of games" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => "Name".to_s, :count => 2
		assert_select "tr>td", :text => "Info".to_s, :count => 2
		assert_select "tr>td", :text => "Download Location".to_s, :count => 2
	end
end
