require 'spec_helper'

describe "blog_comments/index" do
  before(:each) do
    assign(:blog_comments, [
      stub_model(BlogComment,
        :content => "MyText",
        :post => nil,
        :user => nil
      ),
      stub_model(BlogComment,
        :content => "MyText",
        :post => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of blog_comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
