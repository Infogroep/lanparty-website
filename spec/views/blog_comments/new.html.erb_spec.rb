require 'spec_helper'

describe "blog_comments/new" do
  before(:each) do
    assign(:blog_comment, stub_model(BlogComment,
      :content => "MyText",
      :post => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new blog_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_comments_path, :method => "post" do
      assert_select "textarea#blog_comment_content", :name => "blog_comment[content]"
      assert_select "input#blog_comment_post", :name => "blog_comment[post]"
      assert_select "input#blog_comment_user", :name => "blog_comment[user]"
    end
  end
end
