require 'spec_helper'

describe StoreItem do
	before(:each) do
		FactoryGirl.create(:store_item)
	end

	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:price)}

	it {should have_and_belong_to_many(:store_item_classes)}

	it {should validate_uniqueness_of(:name)}
	it {should have_many(:barcodes)}
end
