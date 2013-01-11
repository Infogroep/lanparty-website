require 'spec_helper'
include ERB::Util

describe "compos/show" do
	before(:each) do
		@game = FactoryGirl.create(:game, :name => "d&d")
		@compo = FactoryGirl.create(:compo, :game => @game)
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/Description/)
		rendered.should match(/1/)
		rendered.should match(/2/)
		rendered.should match(/#{h @game.name}/)
		rendered.should match(/#{@compo.date_time}/)
		rendered.should match(/Featured/)
	end
end
