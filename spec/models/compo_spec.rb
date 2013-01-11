require 'spec_helper'

describe Compo do
	before(:each) do
		compo = FactoryGirl.build(:compo, :game => FactoryGirl.create(:game))
	end

	it { should validate_presence_of :slots }
	it { should validate_presence_of :date_time }
	it { should validate_presence_of :group_size }
	it { should validate_presence_of :game }
	it { should belong_to :game }
	it { should have_many :prices }
	it { should have_many :rounds }
	it { should have_many :teams }
	it { should respond_to :featured }
	it { should respond_to :description }

	it "defaults featured to false" do
		x = Compo.new()
		x.featured.should be_false
	end
end
