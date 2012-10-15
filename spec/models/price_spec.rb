require 'spec_helper'

describe Price do
	before(:each) do
		FactoryGirl.create(:price)
	end
	it { should validate_presence_of(:value) }
	it { should validate_presence_of(:sponsor) }
	it { should belong_to(:compo) }
end
