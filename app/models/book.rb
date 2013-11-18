class Book < ActiveRecord::Base
  belongs_to :language
  
  has_many :book_authors
  has_many :authors, :through => :book_authors 
  
  has_many :book_subjects
  has_many :subjects, :through => :book_subjects
  
  has_many :user_books
  has_many :users, :through => :user_books
  
  has_many :harvest_event_books
  has_many :harvest_events, :through => :harvest_event_books
  
  has_and_belongs_to_many :locations
  
  has_many :volumes
  
  has_many :histories, :dependent => :destroy
  
  attr_accessible :bibid, :collection, :contributor, :edition, :end_date, :fill_metadata_fail
  attr_accessible :format_extent, :generate_format_fail, :metadata_index_status, :note, :publisher
  attr_accessible :start_date, :title, :title_alternative, :mods, :volumes
end
