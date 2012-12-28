require 'spec_helper'

describe StoreItemClass do
  it { should validate_presence_of :name }
  it { should have_many :children }
  it { should belong_to :parent }
  it { should have_many :pricing_overrides }
  it { should have_many :store_items }
end
