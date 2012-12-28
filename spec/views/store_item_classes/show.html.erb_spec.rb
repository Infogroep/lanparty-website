require 'spec_helper'

describe "store_item_classes/show" do
  before(:each) do
    @store_item_class = assign(:store_item_class, stub_model(StoreItemClass,
      :name => "Name",
      :parent => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
