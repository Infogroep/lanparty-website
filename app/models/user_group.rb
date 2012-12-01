class UserGroup < ActiveRecord::Base
  attr_accessible :description, :name

  validates_uniqueness_of :name
  validates_presence_of :name

  has_and_belongs_to_many :users
  has_and_belongs_to_many :pricing_defaults
end
