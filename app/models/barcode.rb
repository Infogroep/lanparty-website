class Barcode < ActiveRecord::Base
	attr_accessible :code, :store_item_id
	validates_uniqueness_of :code
	validates_presence_of :code
	validates_presence_of :store_item

	belongs_to :store_item
end
