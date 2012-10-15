require 'spec_helper'

describe "match_scores/show" do
	before(:each) do
		@match_score = assign(:match_score, stub_model(MatchScore,
			:match_id => 1,
			:user_id => 2,
			:score => 3
		))
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/1/)
		rendered.should match(/2/)
		rendered.should match(/3/)
	end
end
