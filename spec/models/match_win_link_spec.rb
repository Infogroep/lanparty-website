require 'spec_helper'

describe MatchWinLink do
	before(:each) do
		FactoryGirl.create(:match_win_link)
	end

	it { should validate_presence_of(:match) }
	it { should validate_presence_of(:next_match) }

	it { should belong_to(:match) }
	it { should belong_to(:next_match).class_name("Match") }
end
