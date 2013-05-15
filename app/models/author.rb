class Author < ActiveRecord::Base
  attr_accessible :book_count, :name
  has_and_belongs_to_many :book
end
