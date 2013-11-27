class Query < ActiveRecord::Base
  belongs_to :user
  attr_accessible :string , :user_id, :created_at
end
