require 'spec_helper'

describe Match do
	it { should validate_presence_of(:round) }
	it { should belong_to(:round) }
	it { should have_many(:match_scores) }
end
