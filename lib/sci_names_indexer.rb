require 'rsolr'

module SciName
  class Indexer
    def self.index_sci_names
      solr = RSolr.connect :url => SOLR_SCI_NAMES
      File.readlines("#{Rails.root}/sci_names.txt").each do |line|
        puts line
        index_single_sci_name(solr,line.strip.downcase)
      end
      solr.commit
      solr.optimize
    end
    
    def self.index_single_sci_name(solr,name)
      begin        
        
        doc = { sci_name: name }       
              
        solr.add doc
        
        return true
      rescue => ex
        puts "Error: #{ex.message}"
        return false
      end
    end
    
    def self.delete_all
      solr = RSolr.connect :url => SOLR_SCI_NAMES
      solr.delete_by_query '*:*'
      solr.commit
      solr.optimize
    end
  end
end