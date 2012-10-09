require 'spec_helper'

describe "compos/show" do
  before(:each) do
    @compo = assign(:compo, stub_model(Compo,
      :info => "Info",
      :slots => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Info/)
    rendered.should match(/1/)
  end
end
