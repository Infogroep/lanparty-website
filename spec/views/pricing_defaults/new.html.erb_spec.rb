require 'spec_helper'

describe "pricing_defaults/new" do
  before(:each) do
    assign(:pricing_default, stub_model(PricingDefault,
      :name => "MyString",
      :description => "MyText",
      :rounding_precision => "9.99",
      :ratio => 1.5
    ).as_new_record)
  end

  it "renders new pricing_default form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pricing_defaults_path, :method => "post" do
      assert_select "input#pricing_default_name", :name => "pricing_default[name]"
      assert_select "textarea#pricing_default_description", :name => "pricing_default[description]"
      assert_select "input#pricing_default_rounding_precision", :name => "pricing_default[rounding_precision]"
      assert_select "input#pricing_default_ratio", :name => "pricing_default[ratio]"
    end
  end
end
