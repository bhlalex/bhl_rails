require File.dirname(__FILE__) + "/bhl/downloader.rb"
require 'uri'
require 'ImageResize'

module EOL
  class Names
    def self.download_all_detalis
      names=Name.all
      download_names(names)
    end
    
    def self.download_missing_details
      names = Name.where('lookup_fail is null or lookup_fail=1')
      download_names(names)
    end
    
    def self.download_all_thumbs
      names = Name.where('lookup_fail=0')
      get_thumbs(names)
    end
    
    def self.download_missing_thumbs
      names = Name.where('lookup_fail=0 and eol_thumb is null')
      get_thumbs(names)
    end
    
    private
    def self.download_names(names)
      total_failed = 0
      total_success = 0
      names_count = names.count
      names.each_with_index do |name, index|
        puts "#{index+1}/#{names_count}: #{name.clean_name}"
        if get_name_details(name)
          total_success = total_success + 1
        else
          total_failed = total_failed + 1
        end
      end
      
      puts "#{total_success.to_s} success, #{total_failed.to_s} failed"
    end
    
    def self.get_name_details(name)
      taxon_concept_id = TaxonConcept.find_taxon_for_name(name.clean_name.downcase)
      if taxon_concept_id.nil?
        name.lookup_fail=1
        name.save
        return false
      else
        name.eol_page_id=taxon_concept_id
        name.lookup_fail=0
        name.save
        return true
      end
    end
    
    def self.get_thumbs(names)
      names_count = names.count
      names.each_with_index do |name, index|
        puts "#{index+1}/#{names_count}: #{name.clean_name}"
        get_thumb(name)
      end
    end
    
    def self.get_thumb(name)
      thumb_url = download_thumb(name)
      if thumb_url
        name.eol_thumb = thumb_url
        name.save
        puts "success"
      else
        name.save
        puts "failed"
      end
    end
    
    def self.download_thumb(name)
      thumb = TaxonConcept.get_image(name.eol_page_id)
      return nil if thumb.nil?
      thumb = thumb.to_s
      thumb_url = "http://media.eol.org/content/#{thumb[0..3]}/#{thumb[4..5]}/#{thumb[6..7]}/#{thumb[8..9]}/#{thumb[10..14]}_orig.jpg"
      
      media_binary = BHL::Downloader.download_file(thumb_url)
      return nil unless media_binary
      
      folder_name = (name.id / THUMBS_PER_FOLDER).to_s
      ext_name = File.extname(thumb_url)
      ext_name = '.jpg' if ext_name.blank? or ext_name.length > 5
      
      save_media_file(media_binary, ext_name, folder_name, name.id)
      
      resize_image(ext_name, folder_name, name.id)
      
      return "#{name.id}#{ext_name}"      
    end
    
    def self.save_media_file(media_binary, file_ext, folder_name, name_id)
      file_location = File.join(Rails.root, "public", "thumbs", folder_name,"#{name_id}#{file_ext}")
      Dir.mkdir(File.join(Rails.root, "public", "thumbs", folder_name)) unless File.exists?(File.join(Rails.root, "public", "thumbs", folder_name))
      open(file_location, 'w') do |file| 
        file.binmode # must be in binary mode
        file.write media_binary
        file.rewind
      end
    end
    
    def self.resize_image(file_ext, folder_name, name_id)
      file_location = File.join(Rails.root, "public", "thumbs", folder_name,"#{name_id}#{file_ext}")
      to_file_location = File.join(Rails.root, "public", "thumbs", folder_name, "small", "#{name_id}#{file_ext}")
      Dir.mkdir(File.join(Rails.root, "public", "thumbs", folder_name, "small")) unless File.exists?(File.join(Rails.root, "public", "thumbs", folder_name, "small"))
      Image.resize(file_location, to_file_location, THUMB_MAX_WIDTH, THUMB_MAX_HEIGHT)
    end
  end
end
