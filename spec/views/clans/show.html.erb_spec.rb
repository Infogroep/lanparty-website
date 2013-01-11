require 'spec_helper'

describe "clans/show" do
  before(:each) do
    @clan = assign(:clan, stub_model(Clan,
      :tag => "Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag/)
  end
end
