require 'spec_helper'

describe StoreItem do
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of :name }
	it { should validate_presence_of :purchase_price }
	it { should validate_numericality_of :purchase_price }
	it { should validate_presence_of :stock }
	it { should validate_numericality_of(:stock).only_integer }
	it { should have_many :barcodes }
	it { should have_many :pricing_overrides }
	it { should belong_to :store_item_class }
end
