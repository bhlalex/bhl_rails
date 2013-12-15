class CollectionRating < ActiveRecord::Base
  belongs_to :collection
  belongs_to :user
  attr_accessible :rate, :collection_id, :user_id, :created_at
end
