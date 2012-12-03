require 'spec_helper'

describe "store_item_classes/index" do
  before(:each) do
    assign(:store_item_classes, [
      stub_model(StoreItemClass,
        :name => "Name",
        :parent => nil
      ),
      stub_model(StoreItemClass,
        :name => "Name",
        :parent => nil
      )
    ])
  end

  it "renders a list of store_item_classes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
