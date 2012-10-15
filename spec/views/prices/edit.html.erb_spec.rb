require 'spec_helper'

describe "prices/edit" do
	before(:each) do
		@price = assign(:price, stub_model(Price,
			:info => "MyString",
			:value => 1.5,
			:sponsor => "MyString"
		))
	end

	it "renders the edit price form" do
		render

		# Run the generator again with the --webrat flag if you want to use webrat matchers
		assert_select "form", :action => prices_path(@price), :method => "post" do
			assert_select "input#price_info", :name => "price[info]"
			assert_select "input#price_value", :name => "price[value]"
			assert_select "input#price_sponsor", :name => "price[sponsor]"
		end
	end
end
