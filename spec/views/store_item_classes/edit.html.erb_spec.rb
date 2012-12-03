require 'spec_helper'

describe "store_item_classes/edit" do
  before(:each) do
    @store_item_class = assign(:store_item_class, stub_model(StoreItemClass,
      :name => "MyString",
      :parent => nil
    ))
  end

  it "renders the edit store_item_class form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => store_item_classes_path(@store_item_class), :method => "post" do
      assert_select "input#store_item_class_name", :name => "store_item_class[name]"
      assert_select "input#store_item_class_parent", :name => "store_item_class[parent]"
    end
  end
end
