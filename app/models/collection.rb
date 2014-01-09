include ActionView::Helpers::SanitizeHelper

class Collection < ActiveRecord::Base
  belongs_to :user
  
  has_many :volume_collections
  has_many :volumes, :through => :volume_collections
  
  has_many :comments, :dependent => :destroy
  has_many :collection_ratings, :dependent => :destroy
  
  has_many :volume_collections
  has_many :volumes, :through => :volume_collections
  
  attr_accessible :created_at,:updated_at, :description, :is_public, :title, :user_id, :photo_name, :rate
  validates :title, :presence => true, :length => {:within => 4..25}
  mount_uploader :photo_name, ImageUploader
  validate :file_size
  
  before_save :sanitize_html

  def sanitize_html
     self.title = sanitize(title, :tags=>[])
     self.description = sanitize(description, :tags=>[])
   end
  
  def self.get_count_by_volume(volume_id, user_id)
    Collection.includes(:volume_collections).where(:volume_collections => {:volume_id => volume_id}).where('is_public=true or user_id=?', user_id).count
  end
  
  def set_rate
    #recalculate rate
    rate1_count = CollectionRating.where(:collection_id => self.id, :rate => 1.0).count
    rate2_count = CollectionRating.where(:collection_id => self.id, :rate => 2.0).count
    rate3_count = CollectionRating.where(:collection_id => self.id, :rate => 3.0).count
    rate4_count = CollectionRating.where(:collection_id => self.id, :rate => 4.0).count
    rate5_count = CollectionRating.where(:collection_id => self.id, :rate => 5.0).count
    
    rate1_count = 0 unless rate1_count
    rate2_count = 0 unless rate2_count
    rate3_count = 0 unless rate3_count
    rate4_count = 0 unless rate4_count
    rate5_count = 0 unless rate5_count
    
    total = rate1_count+ rate2_count+ rate3_count+ rate4_count+ rate5_count
    if total > 0
      average_numerator = (rate1_count*1)+(rate2_count*2)+(rate3_count*3)+(rate4_count*4)+(rate5_count*5)
      average = average_numerator.to_f/total.to_f
      self.rate = average
    else
      self.rate = 0.0
    end
    self.save
    self
  end
  
  private
  # validate size of uploaded photo for collection
def file_size
  if !(photo_name.nil?) && !(photo_name.blank?)
   if photo_name.file.size.to_f/(1000*1000) > UPLOADED_PHOTO_MAX_SIZE
    errors.add(:file, "#{I18n.t(:upload_photo_max_size_error)} #{UPLOADED_PHOTO_MAX_SIZE} #{I18n.t(:mb)}")
  end
    width, height = `identify -format "%wx%h" #{photo_name.file.path}`.split(/x/)
    if (width.to_i/height.to_i >= 1)
      errors.add(:file, "#{I18n.t(:upload_photo_dim_error)}")
    end
  end
end
end