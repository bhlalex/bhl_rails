class BookCollection < ActiveRecord::Base
  belongs_to :volume
  belongs_to :collection
  attr_accessible :position, :volume_id, :collection_id
end
