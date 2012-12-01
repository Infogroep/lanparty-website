class StoreItem < ActiveRecord::Base
	attr_accessible :price, :name

	has_many :barcodes, :dependent => :destroy
	has_and_belongs_to_many :store_item_classes

	validates_presence_of :name, :price
	validates_uniqueness_of :name
end
