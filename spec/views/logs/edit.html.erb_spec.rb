require 'spec_helper'

describe "logs/edit" do
  before(:each) do
    @log = assign(:log, stub_model(Log,
      :message => "MyString",
      :user => nil
    ))
  end

  it "renders the edit log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => logs_path(@log), :method => "post" do
      assert_select "input#log_message", :name => "log[message]"
      assert_select "input#log_user_id", :name => "log[user_id]"
    end
  end
end
