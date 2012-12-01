require 'spec_helper'

describe StoreItem do
	before(:each) do
		FactoryGirl.create(:store_item)
	end

	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:buy_price)}
	it {should validate_presence_of(:store_item_type)}

	it {should validate_uniqueness_of(:name)}
	it {should have_many(:barcodes)}
end
