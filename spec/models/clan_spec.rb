require File.dirname(__FILE__) + '/../spec_helper'

describe Clan do
	def new_clan(attributes = { })
		attributes[:tag] ||= '[foo]clan_tag]'
		Clan.new(attributes)
	end

	before(:each) do
		Clan.delete_all
		@clan = FactoryGirl.create(:clan)
	end

	it "should be valid" do
		new_clan.should be_valid
	end

	it "should require username" do
		new_clan(tag: '').should have(1).error_on(:tag)
	end


end
