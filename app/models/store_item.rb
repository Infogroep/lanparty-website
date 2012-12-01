class StoreItem < ActiveRecord::Base
	attr_accessible :purchase_price, :name, :store_item_type

	has_many :barcodes, :dependent => :destroy
	validates_presence_of :name, :purchase_price, :store_item_type
	validates_uniqueness_of :name
end
