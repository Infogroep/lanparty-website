require 'spec_helper'

describe "compos/index" do
  before(:each) do
    @game = FactoryGirl.create(:game)
    assign(:compos, [
      stub_model(Compo,
        :info => "Info",
        :slots => 1,
        :group_size => 2,
        :game_id => @game.id
      ),
      stub_model(Compo,
        :info => "Info",
        :slots => 1,
        :group_size => 2,
        :game_id => @game.id
      )
    ])
  end

  it "renders a list of compos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "2".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => @game.name.to_s, :count => 2
  end
end
