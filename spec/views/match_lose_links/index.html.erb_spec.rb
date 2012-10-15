require 'spec_helper'

describe "match_lose_links/index" do
	before(:each) do
		assign(:match_lose_links, [
			stub_model(MatchLoseLink,
				:match_id => 1,
				:next_match_id => 2
			),
			stub_model(MatchLoseLink,
				:match_id => 1,
				:next_match_id => 2
			)
		])
	end

	it "renders a list of match_lose_links" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => 1.to_s, :count => 2
		assert_select "tr>td", :text => 2.to_s, :count => 2
	end
end
