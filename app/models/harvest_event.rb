class HarvestEvent < ActiveRecord::Base  
  has_many :harvest_event_books
  has_many :books, :through => :harvest_event_books
    
  belongs_to :harvest_event_type
  attr_accessible :description, :harvest_event_books, :books, :harvest_event_type, :harvest_event_books
end
