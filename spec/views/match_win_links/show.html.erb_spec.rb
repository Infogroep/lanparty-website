require 'spec_helper'

describe "match_win_links/show" do
	before(:each) do
		@match_win_link = assign(:match_win_link, stub_model(MatchWinLink,
			:match_id => 1,
			:next_match_id => 2
		))
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/1/)
		rendered.should match(/2/)
	end
end
