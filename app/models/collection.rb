class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :book_collections
  has_many :books, :through => :book_collections
  has_many :collection_ratings
  # status = false = 0 ===> priavte
  # status = true = 1 ===> public
  attr_accessible :created_at,:updated_at, :description, :status, :title, :user_id, :photo_name
  validates :title, :presence => true,
                       :length => {:within => 4..25}
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

end