require 'spec_helper'

describe "compos/edit" do
	before(:each) do
		@compo = assign(:compo, stub_model(Compo,
			:info => "MyString",
			:slots => 1,
			:group_size => 1
		))
	end

	it "renders the edit compo form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => compos_path(@compo), :method => "post" do
			assert_select "input#compo_group_size", :name => "compo[group_size]"
			assert_select "input#compo_slots", :name => "compo[slots]"
			assert_select "select#compo_game_id", :name => "compo[game_id]"
			assert_select "textarea#compo_description", :name => "compo[description]"
			assert_select "input#compo_date_time", :name => "compo[date_time]"
			assert_select "input.date_picker", :name => "compo[date_time]"
		end
	end
end
