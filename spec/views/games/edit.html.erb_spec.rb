require 'spec_helper'

describe "games/edit" do
	before(:each) do
		@game = assign(:game, stub_model(Game,
			:name => "MyString",
			:info => "MyString",
			:download_location => "MyString"
		))
	end

	it "renders the edit game form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => games_path(@game), :method => "post" do
			assert_select "input#game_name", :name => "game[name]"
			assert_select "input#game_info", :name => "game[info]"
			assert_select "input#game_download_location", :name => "game[download_location]"
		end
	end
end
