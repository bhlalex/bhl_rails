require File.dirname(__FILE__) + "/bhl"
require 'uri'

module BHL
  class LocationUpdater
    def self.update_locations
      locs = get_empty_locations
      locs.each_with_index do |loc, index|
        puts "#{index+1}/#{locs.count}: Downloading location info: #{loc.formatted_address}"
        get_loc_info(loc)
      end        
    end
    
    def self.get_empty_locations
      #return Location.where('latitude is null or longitude is null')
       return Location.where('id=1')     
    end
    
    def self.get_loc_info(loc)
      loc_url = LOCATION_API.sub LOCATION_API_LOC_STRING, URI.escape(loc.formatted_address)      
      puts loc_url
      # get location info
      loc_info = BHL::Downloader.download_file(loc_url)
      
      unless loc_info
        puts "Error downloading location info"
        return        
      end
      
      puts loc_info
    end
  end
end