class Location < ActiveRecord::Base
  belongs_to :country
  attr_accessible :formatted_address, :latitude, :longitude
end
