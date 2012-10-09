require 'spec_helper'

describe Match do
  before(:each) do
    FactoryGirl.create(:match)
  end

  it { should validate_presence_of(:compo) }
  it { should belong_to(:compo) }
end
