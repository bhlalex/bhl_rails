class BookAuthor < ActiveRecord::Base
  belongs_to :book
  belongs_to :author
  attr_accessible :is_alternative, :book, :author
end
