require 'spec_helper'

describe Barcode do
	before(:each) do
		FactoryGirl.create(:barcode)
	end
	it {should validate_presence_of(:code)}
	it {should validate_presence_of(:item)}
	it {should validate_uniqueness_of(:code)}
	it {should belong_to(:item)}
end
