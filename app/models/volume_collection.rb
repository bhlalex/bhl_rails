require 'acts_as_list'
class VolumeCollection < ActiveRecord::Base
  belongs_to :volume
  belongs_to :collection
  attr_accessible :position, :volume_id, :collection_id
  acts_as_list scope: :collection
end
