class Volume < ActiveRecord::Base
  belongs_to :book
  attr_accessible :content_index_status, :copyright, :fill_content_fail, :generate_names_xml_fail, :get_pages_names_fail, :get_thumbnail_fail, :job_id, :name, :ubio_in_dar_fail, :volume_number
end
