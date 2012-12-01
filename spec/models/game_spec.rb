require 'spec_helper'

describe Game do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:download_location) }
	it { should validate_uniqueness_of(:name) }
	it { should validate_uniqueness_of(:download_location) }
end
