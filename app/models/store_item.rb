class StoreItem < ActiveRecord::Base
	attr_accessible :purchase_price, :name, :stock, :store_item_class_id

	has_many :barcodes, :dependent => :destroy
  has_many :pricing_overrides, :as => :payable, :dependent => :destroy
  belongs_to :store_item_class

	validates_presence_of :name, :purchase_price
	validates_uniqueness_of :name
  validates_presence_of :stock
  validates_numericality_of :stock, :only_integer => true, :greater_than_or_equal_to => 0
  validates_presence_of :purchase_price
  validates_numericality_of :purchase_price, :greater_than_or_equal_to => 0
  validates_presence_of :store_item_class

  def price(user)
    # TODO: (URGENT) do something if a person does not have a suitable pricing default
    pricing_default = PricingDefault.find_best_pricing_default(user)
    calculate_overrides(pricing_default)
  end

  def calculate_overrides(pricing_default)
    default_price = pricing_default.apply_transform(purchase_price,purchase_price)
    item_pricing_override = pricing_overrides.where(:pricing_default_id => pricing_default.id).first

    if item_pricing_override
      item_pricing_override.apply_transform(purchase_price, store_item_class.apply_pricing_overrides(pricing_default, purchase_price, default_price))
    else
      store_item_class.apply_pricing_overrides(pricing_default, purchase_price, default_price)
    end
  end
end
