class HarvestEventBook < ActiveRecord::Base
  belongs_to :harvest_event
  belongs_to :book
  attr_accessible :success, :book, :harvest_event
end
