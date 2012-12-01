class PricingDefault < ActiveRecord::Base
  attr_accessible :description, :name, :ratio, :rounding_precision

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :ratio
  validates_presence_of :rounding_precision

  has_and_belongs_to_many :user_groups
  has_many :pricing_overrides
end
