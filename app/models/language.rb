class Language < ActiveRecord::Base
  has_many :book_languages
  has_many :books, :through => :book_languages
  attr_accessible :code, :name
end
