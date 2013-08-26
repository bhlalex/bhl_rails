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
      return Location.where('latitude is null or longitude is null')
    end
    
    def self.get_loc_info(loc)
      loc_url = LOCATION_API.sub LOCATION_API_LOC_STRING, URI.escape(loc.formatted_address)
      # get location info
      loc_info = BHL::Downloader.download_file(loc_url)
      
      unless loc_info
        puts "Error downloading location info"
        return
      end
      
      doc = Nokogiri::XML(loc_info)
            
      unless doc.xpath("//status").text == "OK"
        puts "Error: Location is not recognized"
        return
      end
      
      result = doc.xpath("//result").first
      
      loc.latitude = result.xpath(".//geometry//location//lat").text
      loc.longitude = result.xpath(".//geometry//location//lng").text
      loc.country = find_country(result.xpath(".//address_component"))
      loc.formatted_address = result.xpath(".//formatted_address").text
      
      loc.save
      puts "Success"
    end
    
    def self.find_country(address_components)
      address_components.each do |address_component|
        address_component.xpath(".//type").each do |type|
          if type.text == "country"
            return Country.find_or_create_by_name(address_component.xpath(".//long_name").text)
          end
        end
      end
    end
    
    def self.remove_duplicate_locations
      locations = find_duplicate_locations
      locations.each do |location|
        remove_duplicates(location.formatted_address)
      end
    end
    
    def self.find_duplicate_locations
      Location.select("formatted_address").group("formatted_address").having("count(*) > 1")
    end
    
    def self.remove_duplicates(formatted_address)
      puts "Fixing duplicates in #{formatted_address}"
      duplicated_locations = Location.find_all_by_formatted_address(formatted_address)
      to_id = duplicated_locations.first.id
      duplicated_locations.each do |location|
        if to_id != location.id
          puts "replacing #{location.id} with #{to_id}"
          
          # updating subjects
          Subject.update_all("location_id=#{to_id}", "location_id=#{location.id}")
          
          # updating books_locations
          ActiveRecord::Base.connection.execute("update books_locations set location_id=#{to_id} where location_id=#{location.id}")
          
          # removing location
          location.destroy
        end
      end
    end
  end
end