class Page < ActiveRecord::Base
  belongs_to :volume
  has_and_belongs_to_many :name
  attr_accessible :fill_names_fail, :is_empty, :page_number
end
