class StoreItemClass < ActiveRecord::Base
  attr_accessible :name, :description

  validates_presence_of :name

  has_many :children, :class_name => "StoreItemClass", :foreign_key => :parent_id
  has_many :pricing_overrides, :as => :payable, :dependent => :destroy
  belongs_to :parent, :class_name => "StoreItemClass"
  has_many :store_items
end
