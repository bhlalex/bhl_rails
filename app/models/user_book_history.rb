class UserBookHistory < ActiveRecord::Base
  default_scope :order => 'updated_at DESC'
  belongs_to :user
  belongs_to :volume
  attr_accessible :user_id, :volume_id, :updated_at
end
