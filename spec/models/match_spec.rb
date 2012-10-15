require 'spec_helper'

describe Match do
	before(:each) do
		FactoryGirl.create(:round)
	end

	it { should validate_presence_of(:round) }
	it { should belong_to(:round) }
	it { should have_many(:match_scores) }
end
