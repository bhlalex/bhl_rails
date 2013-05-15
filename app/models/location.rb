class Location < ActiveRecord::Base
  belongs_to :country
  has_and_belongs_to_many :book
  attr_accessible :formatted_address, :latitude, :longitude
end
