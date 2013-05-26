class BookSubject < ActiveRecord::Base
  belongs_to :book
  belongs_to :subject
  belongs_to :subject_type
  
  attr_accessible :book, :subject, :subject_type
end
