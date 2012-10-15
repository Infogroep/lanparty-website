require 'spec_helper'

describe "match_win_links/edit" do
	before(:each) do
		@match_win_link = assign(:match_win_link, stub_model(MatchWinLink,
			:match_id => 1,
			:next_match_id => 1
		))
	end

	it "renders the edit match_win_link form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => match_win_links_path(@match_win_link), :method => "post" do
			assert_select "input#match_win_link_match_id", :name => "match_win_link[match_id]"
			assert_select "input#match_win_link_next_match", :name => "match_win_link[next_match]"
		end
	end
end
