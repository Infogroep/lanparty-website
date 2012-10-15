require 'spec_helper'

describe "match_scores/edit" do
	before(:each) do
		@match_score = assign(:match_score, stub_model(MatchScore,
			:match_id => 1,
			:user_id => 1,
			:score => 1
		))
	end

	it "renders the edit match_score form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => match_scores_path(@match_score), :method => "post" do
			assert_select "input#match_score_match_id", :name => "match_score[match_id]"
			assert_select "input#match_score_user_id", :name => "match_score[user_id]"
			assert_select "input#match_score_score", :name => "match_score[score]"
		end
	end
end
