class Book < ActiveRecord::Base
  belongs_to :language
  has_and_belongs_to_many :author
  has_and_belongs_to_many :location
  attr_accessible :bibid, :collection, :contributor, :edition, :end_date, :fill_metadata_fail, :format_extent, :generate_format_fail, :metadata_index_status, :note, :publisher, :start_date, :title, :title_alternative
end
