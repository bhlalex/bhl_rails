class Query < ActiveRecord::Base
  belongs_to :user
  attr_accessible :string , :user_id, :created_at, :number_of_returned_books
end
