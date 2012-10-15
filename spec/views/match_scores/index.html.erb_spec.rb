require 'spec_helper'

describe "match_scores/index" do
	before(:each) do
		assign(:match_scores, [
			stub_model(MatchScore,
				:match_id => 1,
				:user_id => 2,
				:score => 3
			),
			stub_model(MatchScore,
				:match_id => 1,
				:user_id => 2,
				:score => 3
			)
		])
	end

	it "renders a list of match_scores" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "tr>td", :text => 1.to_s, :count => 2
		assert_select "tr>td", :text => 2.to_s, :count => 2
		assert_select "tr>td", :text => 3.to_s, :count => 2
	end
end
