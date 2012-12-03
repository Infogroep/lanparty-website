class UserGroup < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :allow_group_editing,
                  :allow_store_editing,
                  :allow_stock_editing,
                  :allow_user_editing,
                  :allow_pricing_editing

  validates_uniqueness_of :name
  validates_presence_of :name

  has_and_belongs_to_many :users
  has_and_belongs_to_many :pricing_defaults

  def allows_access?(access_type)
    self.attribute(access_type)
  end
end
