class Page < ActiveRecord::Base
  belongs_to :volume
  has_many :page_names
  has_many :names, :through => :page_names
  attr_accessible :fill_names_fail, :is_empty, :page_number, :volume
end
