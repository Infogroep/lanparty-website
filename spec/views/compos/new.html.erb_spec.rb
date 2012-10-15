require 'spec_helper'

describe "compos/new" do
	before(:each) do
		@game = FactoryGirl.create(:game)
		assign(:compo, stub_model(Compo,
			:info => "MyString",
			:slots => 1,
			:group_size => 1,
			:game_id => @game.id
		).as_new_record)
	end

	it "renders new compo form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => compos_path, :method => "post" do
			assert_select "input#compo_info", :name => "compo[info]"
			assert_select "input#compo_group_size", :name => "compo[group_size]"
			assert_select "input#compo_slots", :name => "compo[slots]"
			assert_select "select#compo_game_id", :name => "compo[game_id]"
		end
	end
end
