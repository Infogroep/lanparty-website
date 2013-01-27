class PricingDefault < ActiveRecord::Base
  include PricingTransform
  attr_accessible :transform, :user_group_ids

  validates_presence_of :transform

  attr_accessible :description, :name, :priority

  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :user_groups
  has_many :pricing_overrides

  def self.find_best_pricing_default(user)
    user.user_groups.map { |group| group.pricing_defaults }
        .flatten.sort { |pricing1,pricing2| pricing1.priority - pricing2.priority }[0]
  end
end
