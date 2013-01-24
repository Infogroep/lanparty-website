class UserGroup < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :store_editing, :user_editing, :blog_editing, :compo_editing, :user_detail_viewing

  validates_uniqueness_of :name
  validates_presence_of :name

  has_and_belongs_to_many :users
  has_and_belongs_to_many :pricing_defaults

  def allows_access?(access_type)
    self.send(access_type) or self.allows_access_transitively?(access_type)
  end

  protected
  @@implied_by = {}
  def self.is_implied_by(one,other)
    if @@implied_by.has_key?(one)
	  @@implied_by[one].push(other)
    else
	  @@implied_by[one] = [other]
    end
  end

  def self.get_implications(one)
	result = @@implied_by[one]
	return result.nil? ? [] : result
  end

  def self.implies(one,other)
	is_implied_by(other,one)
  end

  def allows_access_transitively?(access_type)
	self.class.get_implications(access_type).any? { |atype| self.allows_access?(atype) }
  end

  implies :user_editing, :user_detail_viewing
end
