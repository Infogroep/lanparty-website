class Barcode < ActiveRecord::Base
	attr_accessible :code, :item_id
	validates_uniqueness_of :code
	validates_presence_of :code
	validates_presence_of :item

	belongs_to :item
end
