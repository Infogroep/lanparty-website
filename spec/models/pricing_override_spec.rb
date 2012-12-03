require 'spec_helper'

describe PricingOverride do
  it { should validate_presence_of :payable }
  it { should validate_presence_of :transform }
  it { should validate_uniqueness_of :pricing_default_id }
  it { should validate_uniqueness_of :payable_id }
  it { should belong_to :payable }
  it { should belong_to :pricing_default }
end
