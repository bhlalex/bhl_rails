require 'rsolr'

module Sampledata
  class Indexer
    def self.index_sample_data
      index_volumes
      index_sci_names
      index_names_found
    end
    
    def self.index_sci_names
      begin
        sci_names_solr = RSolr.connect :url => SOLR_SCI_NAMES
        File.readlines("#{Rails.root}/sample_sci_names.txt").each do |line|
          doc = { sci_name: line.strip.downcase }              
          sci_names_solr.add doc
          sci_names_solr.commit
        end      
        sci_names_solr.optimize        
        return true
      rescue => ex
        puts "Error: #{ex.message}"
        return false
      end
    end
    
    def self.index_names_found
      begin
        names_found_solr = RSolr.connect :url => SOLR_NAMES_FOUND
        File.readlines("#{Rails.root}/sample_names_found.txt").each_with_index do |line, index|
          tokens = line.split("\t")
          doc = { id: index, sci_name: tokens[0].strip, job_id: tokens[1].strip, name_found: tokens[2].strip, page: tokens[3].strip }              
          names_found_solr.add doc
          names_found_solr.commit
        end      
        names_found_solr.optimize        
        return true
      rescue => ex
        puts "Error: #{ex.message}"
        return false
      end
    end
    
    def self.index_volumes
      index_lang_volumes("#{Rails.root}/sample_data_en.txt", "en")
      index_lang_volumes("#{Rails.root}/sample_data_fr.txt", "fr")
      index_lang_volumes("#{Rails.root}/sample_data_ge.txt", "ge")
    end
    
    def self.index_lang_volumes(file, lang)
      begin
        volumes_solr = RSolr.connect :url => SOLR_BOOKS_METADATA
        # English books
        File.readlines(file).each do |line|
          tokens = line.split("\t")          
          doc = { job_id: tokens[0].strip, bib_id: tokens[1].strip, language_facet: tokens[7].strip,
                  location_facet: tokens[8].strip, location_search: tokens[9].strip, views: 0, rate: 0  }
          if lang == "en"
            doc[:title_en] = tokens[3].strip
            doc[:author_en] =  tokens[4].split(",")
            doc[:subject_en] =  tokens[5].split(",")
            doc[:publisher_en] =  tokens[6].strip
          elsif lang == "fr"
            doc[:title_fr] = tokens[3].strip
            doc[:author_fr] =  tokens[4].split(",")
            doc[:subject_fr] =  tokens[5].split(",")
            doc[:publisher_fr] =  tokens[6].strip
          elsif lang == "ge"
            doc[:title_ge] = tokens[3].strip
            doc[:author_ge] =  tokens[4].split(",")
            doc[:subject_ge] =  tokens[5].split(",")
            doc[:publisher_ge] =  tokens[6].strip        
          end           
          volumes_solr.add doc
          volumes_solr.commit
        end      
        volumes_solr.optimize        
        return true
      rescue => ex
        puts "Error: #{ex.message}"
        return false
      end
    end    
    
    def self.delete_all
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query '*:*'
      solr.commit
      solr.optimize
      solr = RSolr.connect :url => SOLR_SCI_NAMES
      solr.delete_by_query '*:*'
      solr.commit
      solr.optimize
      solr = RSolr.connect :url => SOLR_NAMES_FOUND
      solr.delete_by_query '*:*'
      solr.commit
      solr.optimize
    end
  end  
end