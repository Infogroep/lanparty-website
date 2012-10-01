class Item < ActiveRecord::Base
  attr_accessible :buy_price, :name, :item_type

  has_many :barcodes, :dependent => :destroy
end
