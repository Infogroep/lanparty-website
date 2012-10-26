require 'spec_helper'

describe "logs/show" do
  before(:each) do
    @log = assign(:log, stub_model(Log,
      :message => "Message",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
    rendered.should match(//)
  end
end
