require 'spec_helper'

describe "blog_posts/new" do
  before(:each) do
    assign(:blog_post, stub_model(BlogPost,
      :title => "MyString",
      :content => "MyText",
      :user => nil
    ).as_new_record)
  end

  it "renders new blog_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blog_posts_path, :method => "post" do
      assert_select "input#blog_post_title", :name => "blog_post[title]"
      assert_select "textarea#blog_post_content", :name => "blog_post[content]"
      assert_select "input#blog_post_user", :name => "blog_post[user]"
    end
  end
end
