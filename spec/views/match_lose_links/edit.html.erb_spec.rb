require 'spec_helper'

describe "match_lose_links/edit" do
  before(:each) do
    @match_lose_link = assign(:match_lose_link, stub_model(MatchLoseLink,
      :match_id => 1,
      :next_match_id => 1
    ))
  end

  it "renders the edit match_lose_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => match_lose_links_path(@match_lose_link), :method => "post" do
      assert_select "input#match_lose_link_match_id", :name => "match_lose_link[match_id]"
      assert_select "input#match_lose_link_next_match", :name => "match_lose_link[next_match]"
    end
  end
end
