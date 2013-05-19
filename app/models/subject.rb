class Subject < ActiveRecord::Base
  belongs_to :location
  has_many :books, :through => :books_subjects
  attr_accessible :location_lookup_fail, :name
end
