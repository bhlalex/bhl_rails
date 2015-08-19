class Volumestatus < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :volumes
end
