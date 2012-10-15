require 'spec_helper'

describe Game do
	before(:each) do
		FactoryGirl.create(:game)
	end

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:download_location) }
	it { should validate_uniqueness_of(:name) }
	it { should validate_uniqueness_of(:download_location) }
end
