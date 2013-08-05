class Volume < ActiveRecord::Base
  belongs_to :book
  has_many :pages
  attr_accessible :content_index_status, :copyright, :fill_content_fail, :generate_names_xml_fail, :get_pages_names_fail 
  attr_accessible :get_thumbnail_fail, :job_id, :name, :ubio_in_dar_fail, :volume_number, :book, :pages
  
  def get_volume_contents
    content = ""
    self.pages.each do |page|
      content << "\n#{page.get_page_content}" unless page.is_empty?
    end
    return content
  end
end
