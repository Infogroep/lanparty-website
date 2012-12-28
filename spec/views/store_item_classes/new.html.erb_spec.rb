require 'spec_helper'

describe "store_item_classes/new" do
  before(:each) do
    assign(:store_item_class, stub_model(StoreItemClass,
      :name => "MyString",
      :parent => nil
    ).as_new_record)
  end

  it "renders new store_item_class form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => store_item_classes_path, :method => "post" do
      assert_select "input#store_item_class_name", :name => "store_item_class[name]"
      assert_select "input#store_item_class_parent", :name => "store_item_class[parent]"
    end
  end
end
