class BooksSubjects < ActiveRecord::Base
  belongs_to :book
  belongs_to :subject
  belongs_to :subject_type
end
