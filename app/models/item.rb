class Item < ActiveRecord::Base
	attr_accessible :buy_price, :name, :item_type

	has_many :barcodes, :dependent => :destroy
	validates_presence_of :name, :buy_price, :item_type
	validates_uniqueness_of :name
end
