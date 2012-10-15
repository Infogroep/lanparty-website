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
			assert_select "input#compo_info", :name => "compo[info]"
			assert_select "input#compo_group_size", :name => "compo[group_size]"
			assert_select "input#compo_slots", :name => "compo[slots]"
			assert_select "select#compo_game_id", :name => "compo[game_id]"
		end
	end

	it "renders the date_time selector in 5 select boxes" do
		render
		assert_select "form", :action => compos_path(@compo), :method => "post" do
			assert_select "select#compo_date_time_1i", :name => "compo[date_time[1i]]"
			assert_select "select#compo_date_time_2i", :name => "compo[date_time[2i]]"
			assert_select "select#compo_date_time_3i", :name => "compo[date_time[3i]]"
			assert_select "select#compo_date_time_4i", :name => "compo[date_time[4i]]"
			assert_select "select#compo_date_time_5i", :name => "compo[date_time[5i]]"
		end
	end
end
