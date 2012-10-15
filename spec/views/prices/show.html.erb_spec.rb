require 'spec_helper'

describe "prices/show" do
	before(:each) do
		@price = assign(:price, stub_model(Price,
			:info => "Info",
			:value => 1.5,
			:sponsor => "Sponsor"
		))
	end

	it "renders attributes in <p>" do
		render
		# Run the generator again with the --webrat flag if you want to use webrat matchers
		rendered.should match(/Info/)
		rendered.should match(/1.5/)
		rendered.should match(/Sponsor/)
	end
end
