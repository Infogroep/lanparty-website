require 'spec_helper'

describe "compos/edit" do
  before(:each) do
    @compo = assign(:compo, stub_model(Compo,
      :info => "MyString",
      :slots => 1
    ))
  end

  it "renders the edit compo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => compos_path(@compo), :method => "post" do
      assert_select "input#compo_info", :name => "compo[info]"
      assert_select "input#compo_slots", :name => "compo[slots]"
    end
  end
end
