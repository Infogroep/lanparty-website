class UserGroup < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :store_editing, :user_editing, :blog_editing

  validates_uniqueness_of :name
  validates_presence_of :name

  has_and_belongs_to_many :users
  has_and_belongs_to_many :pricing_defaults

  def allows_access?(access_type)
    self.send(access_type)
  end
end
