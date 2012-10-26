require 'spec_helper'

describe Log do
	it { should belong_to :user }
	it { should validate_presence_of :message }
	it { should validate_presence_of :user }
end
