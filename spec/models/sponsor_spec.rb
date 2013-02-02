require 'spec_helper'

describe Sponsor do
  it { should validate_presence_of :name }
  it { should validate_presence_of :website }
  it { should validate_uniqueness_of :name }
end
