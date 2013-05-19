class Annotation < ActiveRecord::Base
  belongs_to :volume
  belongs_to :page  
  belongs_to :user
  attr_accessible :height, :hltype, :location_x, :location_y, :string, :type, :width, :zorder
end
