class PricingDefault < ActiveRecord::Base
  include PricingTransform
  attr_accessible :transform

  validates_presence_of :transform

  attr_accessible :description, :name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :user_groups
  has_many :pricing_overrides
end
