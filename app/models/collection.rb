class Collection < ActiveRecord::Base
  has_many :book_collections
  has_many :books, :through => :book_collections
  attr_accessible :creation_date, :description, :last_modified_date, :status, :title
end