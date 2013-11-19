class BookCollection < ActiveRecord::Base
  belongs_to :book
  belongs_to :collection
  attr_accessible :order, :book_id, :collection_id
  attr_accessor selected
end
