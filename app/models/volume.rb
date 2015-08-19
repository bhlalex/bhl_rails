class Volume < ActiveRecord::Base
  belongs_to :book
  has_many :pages
  has_many :volume_ratings
  has_many :comments
  
  has_many :volume_collections
  has_many :collections, :through => :volume_collections
  
  belongs_to :volumetatuses
   
  attr_accessible :rate, :content_index_status, :copyright, :fill_content_fail, :generate_names_xml_fail, :get_pages_names_fail 
  attr_accessible :get_thumbnail_fail, :job_id, :name, :ubio_in_dar_fail, :volume_number, :book, :pages
  
  def get_volume_contents
    content = ""
    self.pages.each do |page|
      content << "\n#{page.get_page_content}" unless page.is_empty?
    end
    return content
  end
  
  def set_rate
    #recalculate rate
    rate1_count = VolumeRating.where(:volume_id => self.id, :rate => 1.0).count
    rate2_count = VolumeRating.where(:volume_id => self.id, :rate => 2.0).count
    rate3_count = VolumeRating.where(:volume_id => self.id, :rate => 3.0).count
    rate4_count = VolumeRating.where(:volume_id => self.id, :rate => 4.0).count
    rate5_count = VolumeRating.where(:volume_id => self.id, :rate => 5.0).count
    total = rate1_count+ rate2_count+ rate3_count+ rate4_count+ rate5_count
    
    average_numerator = (rate1_count*1)+(rate2_count*2)+(rate3_count*3)+(rate4_count*4)+(rate5_count*5)
    average = total != 0 ? average_numerator.to_f/total.to_f : 0.0
    self.rate = average
    self.save
    self
  end
  # moved from book to volume as in db table book_views we store job_id
  def view_count
    self.class.find_by_sql("SELECT COUNT(*) AS total FROM 
                              ((SELECT book_id1
                                FROM book_views
                                WHERE book_id2 = #{self.job_id})
                              UNION
                              (SELECT book_id2
                                    FROM book_views
                                    WHERE book_id1 = #{self.job_id})
                              ) result;")[0].total
  end
end
