require 'spec_helper'

describe Round do
	it { should validate_presence_of(:compo) }
	it { should belong_to(:compo) }

end
