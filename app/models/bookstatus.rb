class Bookstatus < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :books
end
