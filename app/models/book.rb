class Book < ActiveRecord::Base
  has_many :book_languages
  has_many :languages, :through => :book_languages 
  
  has_many :book_authors
  has_many :authors, :through => :book_authors 
  
  has_many :book_subjects
  has_many :subjects, :through => :book_subjects
  
  has_many :user_books
  has_many :users, :through => :user_books
  
  has_many :harvest_event_books
  has_many :harvest_events, :through => :harvest_event_books
  
  has_many :book_locations
  has_many :locations, :through => :book_locations
  
  has_many :volumes
  
  has_many :histories, :dependent => :destroy
  
  belongs_to :bookstatuses
  
  attr_accessible :bibid, :collection, :contributor, :edition, :end_date, :fill_metadata_fail
  attr_accessible :format_extent, :generate_format_fail, :metadata_index_status, :note, :publisher
  attr_accessible :start_date, :title, :title_alternative, :mods, :volumes
  
  def meta_keywords
    Name.find_names_in_volume(self.volumes.first.id).map{|name| "#{name.string}"}.join(", ")
  end
  
  def meta_description
    "Title: #{self.title}" +
      " - By: " + self.authors.map{|author| "#{author.name}"}.join(", ") +
      " - Covers species: " + 
      Name.find_names_in_volume(self.volumes.first.id).map{|name| "#{name.string}"}.join(", ")
  end
  
  def meta_author
    self.authors.map{|author| "#{author.name}"}.join(", ")
  end
  
  # I removed this from here as self.id retirn a book id but in the database we store job id so this is moved to volume
#  def view_count
#    self.class.find_by_sql("SELECT COUNT(*) AS total FROM 
#                              ((SELECT book_id1
#                                FROM book_views
#                                WHERE book_id2 = #{self.id})
#                              UNION
#                              (SELECT book_id2
#                                    FROM book_views
#                                    WHERE book_id1 = #{self.id})
#                              ) result;")[0].total
#  end
end
