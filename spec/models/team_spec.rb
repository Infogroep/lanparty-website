require 'spec_helper'

describe Team do
	before(:each) do
		@team = FactoryGirl.create(:team)
	end
  it { should validate_presence_of(:name) }
	it { should validate_presence_of(:compo) }
	it { should belong_to(:compo) }
	it { should have_and_belong_to_many(:users) }
	it { should belong_to(:compo) }

	describe "linking users and teams" do
		before(:each) do
			@user = FactoryGirl.create(:user)
			@user1= FactoryGirl.create(:user)
		end
		it "adds 1 users" do
			@team.users << @user
			@team.users.count.should == 1
		end
		it "contains added users" do
			@team.users << @user
			@team.users.should include(@user)
		end
		it "adds multiple users" do
			@team.users << @user
			@team.users << @user1
			@team.users.count.should == 2
		end
		it "is persistent" do
			@team.users << @user
			@team.reload
			@team.users.count.should == 1
		end
	end
	describe "linking compos and teams" do
		before(:each) do
			@compo = FactoryGirl.create(:compo)
		end
	end
end
