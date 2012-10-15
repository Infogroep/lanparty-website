require 'spec_helper'

describe "match_win_links/index" do
	before(:each) do
		assign(:match_win_links, [
			stub_model(MatchWinLink,
				:match_id => 1,
				:next_match_id => 3
			),
			stub_model(MatchWinLink,
				:match_id => 1,
				:next_match_id => 3
			)
		])
	end

	it "renders a list of match_win_links" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => 1.to_s, :count => 2
		assert_select "tr>td", :text => 3.to_s, :count => 2
	end
end
