class StoreItemClass < ActiveRecord::Base
  attr_accessible :name, :description

  validates_presence_of :name

  has_many :children, :class_name => "StoreItemClass", :foreign_key => :parent_id
  has_many :pricing_overrides, :as => :payable, :dependent => :destroy
  belongs_to :parent, :class_name => "StoreItemClass"
  has_many :store_items

  def apply_pricing_overrides(pricing_default, original_price, cumulative_price)
    override = pricing_overrides.where(:pricing_default_id => pricing_default.id).first
    if override
      override.apply_transform(original_price, recurse_pricing_overrides(pricing_default, original_price, cumulative_price))
    else
      recurse_pricing_overrides(pricing_default, original_price, cumulative_price)
    end
  end

  def recurse_pricing_overrides(pricing_default, original_price, cumulative_price)
    if parent
      parent.apply_pricing_overrides(pricing_default, original_price, cumulative_price)
    else
      cumulative_price
    end
  end
end
