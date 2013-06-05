class PageName < ActiveRecord::Base
  belongs_to :page
  belongs_to :name
  attr_accessible :page, :name, :namestring
end
