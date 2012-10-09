class Compo < ActiveRecord::Base
  attr_accessible :date, :info, :slots, :match_id, :group_size
  validates_presence_of :date
  validates_presence_of :slots
  validates_presence_of :group_size

  belongs_to :game
  has_many :prices
  has_many :matches
end
