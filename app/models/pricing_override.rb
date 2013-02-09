class PricingOverride < ActiveRecord::Base
	include PricingTransform
	attr_accessible :transform, :pricing_default_id, :payable_id, :payable_type

	validates_presence_of :transform

	belongs_to :payable, :polymorphic => true
	belongs_to :pricing_default

	validates_presence_of :payable
	validates_uniqueness_of :pricing_default_id, :scope => :payable_id
	validates_uniqueness_of :payable_id, :scope => :pricing_default_id
end
