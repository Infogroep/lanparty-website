require 'spec_helper'

describe "pricing_defaults/show" do
  before(:each) do
    @pricing_default = assign(:pricing_default, stub_model(PricingDefault,
      :name => "Name",
      :description => "MyText",
      :transform => "trololo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/trololo/)
  end
end
