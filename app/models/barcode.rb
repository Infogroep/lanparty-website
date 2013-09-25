class Barcode < ActiveRecord::Base
	validates_uniqueness_of :code
	validates_presence_of :code
	validates_presence_of :store_item

	belongs_to :store_item
end
