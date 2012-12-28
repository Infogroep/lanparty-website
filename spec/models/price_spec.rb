require 'spec_helper'

describe Price do
	it { should validate_presence_of(:value) }
	it { should validate_presence_of(:sponsor) }
	it { should belong_to(:compo) }
end
