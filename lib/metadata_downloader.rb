require 'net/http'
require 'uri'
require 'socket'

module DAR
  class MetadataDownloader
    
    def self.download_all_metadata
      download_metadata(true)
    end
    
    def self.download_empty_metadata
      download_metadata(false)
    end    
    
    def self.download_metadata(download_all)
      
    end
  end
end