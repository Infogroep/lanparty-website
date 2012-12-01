require 'spec_helper'

describe "pricing_defaults/show" do
  before(:each) do
    @pricing_default = assign(:pricing_default, stub_model(PricingDefault,
      :name => "Name",
      :description => "MyText",
      :rounding_precision => "9.99",
      :ratio => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/9.99/)
    rendered.should match(/1.5/)
  end
end
