class Barcode < ActiveRecord::Base
  attr_accessible :code, :item_id

  belongs_to :item
end
