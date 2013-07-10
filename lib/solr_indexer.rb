require 'rsolr'

module SOLR
  class Indexer
    def self.index_books(books)      
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      books_count = books.count
      books.each_with_index do |book, index|
        # commit or not yet
        if index > 0 && index % SOLR_COMMIT_EVERY_COUNT == 0
          puts "Commit"
          solr.commit
        end
        
        puts "#{index + 1}/#{books_count}: Book #{book.bibid}"
        
        if index_single_book(solr, book)
          book.metadata_index_status=1
          book.save
        else
          book.metadata_index_status=0
          book.save
        end
      end
      puts "Commit"
      solr.commit
      puts "Optimize"
      solr.optimize
    end
    
    def self.index_single_book(solr, book)
      begin
        
        volume = book.volumes.first
        
        doc = {:vol_jobid => volume.job_id, :bok_bibid => book.bibid}
        doc[:bok_start_date] = Date.parse("#{book.start_date}-1-1").strftime("%Y-%m-%dT00:00:00Z") unless book.end_date.nil?
        doc[:bok_end_date] = Date.parse("#{book.end_date}-1-1").strftime("%Y-%m-%dT00:00:00Z") unless book.end_date.nil?
        doc[:bok_publisher] = book.publisher
        doc[:bok_title] = [book.title, book.title_alternative]
        doc[:bok_language] = book.language.name unless book.language.blank?
        doc[:published_at] = DateTime.now.strftime("%Y-%m-%dT00:00:00Z")
        doc[:vol_name] = volume.name
              
        # index names
        names_found = []      
        names = Name.find_names_in_volume(volume.id)      
        names.each do |name|
          names_found << name.string
        end
        doc[:name] = names_found
        
        #index authors
        authors_found = []
        book.authors.each do |author|
          authors_found << author.name
        end
        doc[:author] = authors_found
        
        #index locations
        loc_found = []
        book.locations.each do |location|
          loc_found << location.formatted_address
        end
        doc[:geo_location] = loc_found
        
        #index Subjects
        subjects_found = []
        book.subjects.each do |subject|
          subjects_found << subject.name
        end
        doc[:subject] = subjects_found
        
        doc[:content] = volume.get_volume_contents
              
        solr.add doc
        
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
    end
  end
end
