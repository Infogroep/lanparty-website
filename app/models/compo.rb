class Compo < ActiveRecord::Base
  attr_accessible :date_time, :info, :slots, :match_id, :group_size, :game_id
  validates_presence_of :date_time
  validates_presence_of :slots
  validates_presence_of :group_size
  validates_presence_of :game

  belongs_to :game
  has_many :prices
  has_many :rounds
end
