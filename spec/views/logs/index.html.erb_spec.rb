require 'spec_helper'

describe "logs/index" do
  before(:each) do
		@user = FactoryGirl.create(:user)
    assign(:logs, [
      stub_model(Log,
        :message => "Message",
        :user => @user
      ),
      stub_model(Log,
        :message => "Message",
        :user => @user
      )
    ])
  end

  it "renders a list of logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => @user.username, :count => 2
  end
end
