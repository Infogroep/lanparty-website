require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :name => "MyString",
      :buy_price => 1.5
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_name", :name => "item[name]"
      assert_select "input#item_buy_price", :name => "item[buy_price]"
    end
  end
end
