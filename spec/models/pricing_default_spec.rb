require 'spec_helper'

describe PricingDefault do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :transform }
  it { should have_and_belong_to_many :user_groups }
  it { should have_many :pricing_overrides }
end
