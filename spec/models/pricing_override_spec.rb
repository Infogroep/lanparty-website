require 'spec_helper'

describe PricingOverride do
  it { should validate_presence_of :price }
  it { should validate_presence_of :store_item }
  it { should validate_uniqueness_of :pricing_default_id }
  it { should belong_to :store_item }
  it { should belong_to :pricing_default }
end
