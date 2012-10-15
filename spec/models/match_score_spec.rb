require 'spec_helper'

describe MatchScore do
	before(:each) do
		FactoryGirl.create(:match_score)
	end

	it { should validate_presence_of(:match) }
	it { should validate_presence_of(:user) }
	it { should belong_to(:match) }
	it { should belong_to(:user) }
end
