class Author < ActiveRecord::Base
  attr_accessible :book_count, :name
  
  has_many :book_authors
  has_many :books, :through => :book_authors
  
  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive => false
end
