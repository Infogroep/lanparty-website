require 'spec_helper'

describe Item do
	before(:each) do
		FactoryGirl.create(:item)
	end

	it {should validate_presence_of(:name)}
	it {should validate_presence_of(:buy_price)}
	it {should validate_presence_of(:item_type)}

	it {should validate_uniqueness_of(:name)}
	it {should have_many(:barcodes)}
end
