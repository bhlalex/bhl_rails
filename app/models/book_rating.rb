class BookRating < ActiveRecord::Base
  belongs_to :volume
  belongs_to :user
  attr_accessible :rate, :user_id, :volume_id
end
