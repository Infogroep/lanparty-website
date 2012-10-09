class Round < ActiveRecord::Base
  attr_accessible :compo_id

  validates_presence_of :compo
  belongs_to :compo
end
