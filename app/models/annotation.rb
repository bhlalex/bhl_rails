class Annotation < ActiveRecord::Base
  belongs_to :volume
  belongs_to :page  
  belongs_to :user
  #variables :anntype, :text, :volume_id, :user_id and :page_id are added by Yosra
  attr_accessible :height, :hltype, :location_x, :location_y, :string, :type, :width, :zorder, :text, :volume_id, :user_id, :page_id, :anntype
end
