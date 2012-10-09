require 'spec_helper'

describe "compos/index" do
  before(:each) do
    assign(:compos, [
      stub_model(Compo,
        :info => "Info",
        :slots => 1
      ),
      stub_model(Compo,
        :info => "Info",
        :slots => 1
      )
    ])
  end

  it "renders a list of compos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Info".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
