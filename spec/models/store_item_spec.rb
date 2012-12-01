require 'spec_helper'

describe StoreItem do
	it {should validate_presence_of :name}
	it {should validate_presence_of :purchase_price}
	it {should validate_presence_of :store_item_type}

	it {should validate_uniqueness_of :name}
	it {should have_many :barcodes}
  it {should have_many :pricing_overrides}
end
