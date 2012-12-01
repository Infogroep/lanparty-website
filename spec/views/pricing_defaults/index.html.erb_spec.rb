require 'spec_helper'

describe "pricing_defaults/index" do
  before(:each) do
    assign(:pricing_defaults, [
      stub_model(PricingDefault,
        :name => "Name",
        :description => "MyText",
        :rounding_precision => "9.99",
        :ratio => 1.5
      ),
      stub_model(PricingDefault,
        :name => "Name",
        :description => "MyText",
        :rounding_precision => "9.99",
        :ratio => 1.5
      )
    ])
  end

  it "renders a list of pricing_defaults" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
