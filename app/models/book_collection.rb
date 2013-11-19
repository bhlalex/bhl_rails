class BookCollection < ActiveRecord::Base
  belongs_to :book
  belongs_to :collection
  attr_accessible :order
end
