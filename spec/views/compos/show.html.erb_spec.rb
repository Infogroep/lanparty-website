require 'spec_helper'

describe "compos/show" do
	before(:each) do
		@game = FactoryGirl.create(:game)
		@compo = FactoryGirl.create(:compo)
		@compo.game = @game
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/Info/)
		rendered.should match(/1/)
		rendered.should match(/2/)
		rendered.should match(/#{@game.name}/)
		rendered.should match(/#{@compo.time}/)
	end
end
