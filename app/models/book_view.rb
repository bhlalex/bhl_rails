class BookView < ActiveRecord::Base
  belongs_to :book
  belongs_to :book
  attr_accessible :book_id1, :book_id2
end