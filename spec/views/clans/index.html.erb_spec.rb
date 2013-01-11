require 'spec_helper'

describe "clans/index" do
  before(:each) do
    assign(:clans, [
      stub_model(Clan,
        :tag => "Tag"
      ),
      stub_model(Clan,
        :tag => "Tag"
      )
    ])
  end

  it "renders a list of clans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag".to_s, :count => 2
  end
end
