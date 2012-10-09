require 'spec_helper'

describe "MatchScores" do
  describe "GET /match_scores" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get match_scores_path
      response.status.should be(200)
    end
  end
end
