require 'spec_helper'

describe "clans/new" do
  before(:each) do
    assign(:clan, stub_model(Clan,
      :tag => "MyString"
    ).as_new_record)
  end

  it "renders new clan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clans_path, :method => "post" do
      assert_select "input#clan_tag", :name => "clan[tag]"
    end
  end
end
