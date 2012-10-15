require 'spec_helper'

describe Team do
  it { should validate_presence_of(:name) }
	it { should validate_presence_of(:compo) }
	it { should belong_to(:compo) }
	it { should have_and_belong_to_many(:users) }
end
