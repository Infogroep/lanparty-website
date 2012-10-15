require 'spec_helper'

describe "match_scores/new" do
	before(:each) do
		assign(:match_score, stub_model(MatchScore,
			:match_id => 1,
			:user_id => 1,
			:score => 1
		).as_new_record)
	end

	it "renders new match_score form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => match_scores_path, :method => "post" do
			assert_select "input#match_score_match_id", :name => "match_score[match_id]"
			assert_select "input#match_score_user_id", :name => "match_score[user_id]"
			assert_select "input#match_score_score", :name => "match_score[score]"
		end
	end
end
