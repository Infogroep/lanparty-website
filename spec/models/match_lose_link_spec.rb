require 'spec_helper'

describe MatchLoseLink do
	before(:each) do
		FactoryGirl.create(:match_lose_link)
	end

	it { should validate_presence_of(:match) }
	it { should validate_presence_of(:next_match) }

	it { should belong_to(:match) }
	it { should belong_to(:next_match).class_name("Match") }
end
