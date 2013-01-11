require File.dirname(__FILE__) + '/../spec_helper'

describe User do
	def new_user(attributes = {})
		attributes[:username] ||= 'foo'
		attributes[:email] ||= 'foo@example.com'
		attributes[:password] ||= 'abc123'
		attributes[:password_confirmation] ||= attributes[:password]
		User.new(attributes)
	end

	before(:each) do
		User.delete_all
		@user = FactoryGirl.create(:user)
	end

	it { should have_and_belong_to_many :teams }
	it { should have_many :logs}

	it "should be valid" do
		new_user.should be_valid
	end

	it "should require username" do
		new_user(:username => '').should have(1).error_on(:username)
	end

	it "should require password" do
		new_user(:password => '').should have(1).error_on(:password)
	end

	it "should require well formed email" do
		new_user(:email => 'foo@bar@example.com').should have(1).error_on(:email)
	end

	it "should validate uniqueness of email" do
		new_user(:email => 'bar@example.com').save!
		new_user(:email => 'bar@example.com').should have(1).error_on(:email)
	end

	it "should validate uniqueness of username" do
		new_user(:username => 'uniquename').save!
		new_user(:username => 'uniquename').should have(1).error_on(:username)
	end

	it "should not allow odd characters in username" do
		new_user(:username => 'odd ^&(@)').should have(1).error_on(:username)
	end

	it "should validate password is longer than 3 characters" do
		new_user(:password => 'bad').should have(1).error_on(:password)
	end

	it "should require matching password confirmation" do
		new_user(:password_confirmation => 'nonmatching').should have(1).error_on(:password)
	end

	it "should generate password hash and salt on create" do
		user = new_user
		user.save!
		user.password_hash.should_not be_nil
		user.password_salt.should_not be_nil
	end
	
	it "should link users to a clan" do
		user = new_user
		clan = FactoryGirl.create(:clan)
		user.clan = clan
		user.save!
		User.find_by_username(user.username).clan.tag.should == clan.tag
	end
	
	it "should create new clan on user creation" do
		tag = "[clan_tag]"
		new_user(:clan_tag => tag).save!
		User.find_by_username(new_user.username).clan.tag.should == tag
	end

	it "should authenticate by username" do
		user = new_user(:username => 'foobar', :password => 'secret')
		user.save!
		User.authenticate('foobar', 'secret').should == user
	end

	it "should authenticate by email" do
		user = new_user(:email => 'foo@bar.com', :password => 'secret')
		user.save!
		User.authenticate('foo@bar.com', 'secret').should == user
	end

	it "should not authenticate bad username" do
		User.authenticate('nonexisting', 'secret').should be_nil
	end

	it "should not authenticate bad password" do
		new_user(:username => 'foobar', :password => 'secret').save!
		User.authenticate('foobar', 'badpassword').should be_nil
	end
	
	describe "linking users and teams" do
		before(:each) do
			compo = FactoryGirl.create(:compo, :game => FactoryGirl.create(:game))
			@team = FactoryGirl.create(:team, :compo => compo)
			@team1= FactoryGirl.create(:team, :compo => compo)
		end
		it "adds 1 team" do
			@user.teams << @team
			@user.teams.count.should == 1
		end
		it "contains added teams" do
			@user.teams << @team
			@user.teams.should include(@team)
		end
		it "adds multiple teams" do
			@user.teams << @team
			@user.teams << @team1
			@user.teams.count.should == 2
		end
		it "is persistent" do
			@user.teams << @team
			@user.reload
			@user.teams.count.should == 1
		end
	end

end
