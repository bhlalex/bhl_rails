require 'net/http'
require 'uri'
require 'socket'

module BHL
  class Downloader
    def self.download_file(file_url)
      if PROXY_ADDRESS.empty?
        return download_file_without_proxy(file_url)
      else
        return download_file_with_proxy(file_url)
      end
    end
    
    private
    def self.download_file_with_proxy(file_url)
      http = Net::HTTP::Proxy(PROXY_ADDRESS, PROXY_PORT, PROXY_USERNAME, PROXY_PASSWORD)      
      begin
        url = URI.parse(file_url)
        resp=http.get_response(url)
        if resp.kind_of? Net::HTTPSuccess
          return resp.body
        else
          return nil
        end
      rescue
        return nil
      end
    end
    
    def self.download_file_without_proxy(file_url)
      begin
        url = URI.parse(file_url)
        resp=Net::HTTP.get_response(url)
        if resp == Net::HTTPSuccess
          return resp.body
        else
          return nil
        end
      rescue
        return nil
      end
    end
  end  
end