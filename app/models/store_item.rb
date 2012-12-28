class StoreItem < ActiveRecord::Base
	attr_accessible :purchase_price, :name, :stock

	has_many :barcodes, :dependent => :destroy
  has_many :pricing_overrides, :as => :payable, :dependent => :destroy
  belongs_to :store_item_class

	validates_presence_of :name, :purchase_price
	validates_uniqueness_of :name
  validates_presence_of :stock
  validates_numericality_of :stock, :only_integer => true, :greater_than_or_equal_to => 0
  validates_presence_of :purchase_price
  validates_numericality_of :purchase_price, :greater_than_or_equal_to => 0
end
