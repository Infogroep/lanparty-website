class StoreItem < ActiveRecord::Base
	attr_accessible :buy_price, :name, :store_item_type

	has_many :barcodes, :dependent => :destroy
	validates_presence_of :name, :buy_price, :store_item_type
	validates_uniqueness_of :name
end
