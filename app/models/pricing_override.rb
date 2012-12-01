class PricingOverride < ActiveRecord::Base
  belongs_to :store_item
  belongs_to :pricing_default
  attr_accessible :price

  validates_presence_of :store_item
  validates_presence_of :price
  validates_uniqueness_of :pricing_default_id, :scope => :store_item_id
end
