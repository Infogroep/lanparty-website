require 'spec_helper'

describe Compo do
	it { should validate_presence_of(:slots) }
	it { should validate_presence_of(:date_time) }
	it { should validate_presence_of(:group_size) }
	it { should validate_presence_of(:game) }
	it { should belong_to(:game) }
	it { should have_many(:prices) }
	it { should have_many(:rounds) }
	it { should have_many(:teams) }
end
