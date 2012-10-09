require 'spec_helper'

describe "compos/new" do
  before(:each) do
    assign(:compo, stub_model(Compo,
      :info => "MyString",
      :slots => 1
    ).as_new_record)
  end

  it "renders new compo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compos_path, :method => "post" do
      assert_select "input#compo_info", :name => "compo[info]"
      assert_select "input#compo_slots", :name => "compo[slots]"
    end
  end
end
