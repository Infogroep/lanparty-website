require 'spec_helper'

describe "blog_comments/show" do
  before(:each) do
    @blog_comment = assign(:blog_comment, stub_model(BlogComment,
      :content => "MyText",
      :post => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
