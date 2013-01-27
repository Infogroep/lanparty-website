class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :store_item
  attr_accessible :count, :order_id, :store_item_id

  validates_presence_of :order
  validates_presence_of :store_item
  validates_uniqueness_of :store_item_id, :scope => :order_id
  validates_presence_of :count
  validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0

  def price(user)
    unit_price(user) * count
  end

  def unit_price(user)
    store_item.price(user)
  end
end
