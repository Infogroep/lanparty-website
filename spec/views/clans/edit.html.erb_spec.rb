require 'spec_helper'

describe "clans/edit" do
  before(:each) do
    @clan = assign(:clan, stub_model(Clan,
      :tag => "MyString"
    ))
  end

  it "renders the edit clan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clans_path(@clan), :method => "post" do
      assert_select "input#clan_tag", :name => "clan[tag]"
    end
  end
end
