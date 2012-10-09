class Match < ActiveRecord::Base
  attr_accessible :round_id

  validates_presence_of :round

  belongs_to :round
end
