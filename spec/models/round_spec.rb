require 'spec_helper'

describe Round do
	before(:each) do
		FactoryGirl.create(:compo)
	end

	it { should validate_presence_of(:compo) }
	it { should belong_to(:compo) }

end
