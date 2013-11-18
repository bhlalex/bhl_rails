class UserBookHistory < ActiveRecord::Base
  default_scope :order => 'last_visited_date DESC'
  belongs_to :user
  belongs_to :volume
  attr_accessible :last_visited_date, :user_id, :volume_id
end
