require File.dirname(__FILE__) + "/bhl"

module DAR
  class MetadataDownloader
    
    def self.download_all_metadata
      if any_pending_harvest?
        puts "Error: a pending harvest must be finished first"
        return
      end 
      harvest_event = create_harvest_event("Download all books metadata", "")      
      books = Book.all
      harvest_event.books << books      
      download_books_metadata(harvest_event, books)
    end
    
    def self.download_empty_or_failed_metadata
      if any_pending_harvest?
        puts "Error: a pending harvest must be finished first"
        return
      end 
      harvest_event = create_harvest_event("Download empty or failed books metadata", "")
      books = Book.where("fill_metadata_fail != 0") # either 1 or null
      harvest_event.books << books      
      download_books_metadata(harvest_event, books)
    end
    
    def self.resume_latest_harvest      
      harvest_event = HarvestEvent.find_by_sql("select * from harvest_events where exists (select * from harvest_event_books where harvest_events.id=harvest_event_id and success is null);")
      if harvest_event.count > 0        
        books = Book.find_by_sql("select books.* from books inner join harvest_event_books on books.id=harvest_event_books.book_id where harvest_event_id=#{harvest_event.first.id} and success is null;")        
      else
        puts "No harvest to resume!"
        return
      end
      download_books_metadata(harvest_event.first, books)
    end
    
    def self.any_pending_harvest?
      harvest_event = HarvestEvent.find_by_sql("select * from harvest_events where exists (select * from harvest_event_books where success is null);")
      if harvest_event.count > 0
        return true
      else
        return false
      end
    end
    
    def self.create_harvest_event(harvest_type_name, description)
      harvest_event_type = HarvestEventType.find_or_create_by_name(harvest_type_name)
      return HarvestEvent.create(:harvest_event_type => harvest_event_type, :description => description)
    end    
    
    def self.download_books_metadata(harvest_event, books)      
      books.each_with_index do |book, index|
        puts "#{index+1}/#{books.count}: Downloading book metadata: #{book.bibid}"
        harvest_status = download_metadata(book)
        puts "Success: #{harvest_status}"        
        
        # update success parameter in HarvestEventBook
        harvest_event_book = HarvestEventBook.find_by_harvest_event_id_and_book_id(harvest_event.id, book.id)
        harvest_event_book.success = harvest_status
        harvest_event_book.save
      end
    end
    
    def self.download_metadata(book)
      book_url = DAR_API_METADATA.sub DAR_API_METADATA_BIBID_STRING, book.bibid
      
      # get metadata from DAR
      book_metadata = BHL::Downloader.download_file(book_url)
      
      # this means that downloading metadata fails
      unless book_metadata
        book.fill_metadata_fail = 1
        book.save
        return false
      end 
      doc = Nokogiri::XML(book_metadata)
      
      begin            
        # check the title, is it title or alternative      
        doc.xpath('//xmlns:titleInfo').each do |titleInfo|
           if titleInfo.attr('type') == 'alternative'
             book.title_alternative = get_title(titleInfo)
           else
             book.title = get_title(titleInfo)
           end       
        end
      rescue
        # this means that there is something wrong with the file
        book.fill_metadata_fail = 1
        book.save
        return false        
      end
      
      book.authors.clear
      # check for authors
      doc.xpath('//xmlns:name').each do |name|
        if name.attr('type') == 'personal'
          author_name = get_name(name)
          author = Author.find_or_create_by_name(author_name)
          book_author = BookAuthor.new(:author => author, :book => book)
          
          if name.xpath('.//xmlns:roleTerm').text == "creator"
            book_author.is_alternative = 0
          else
            book_author.is_alternative = 1
          end
          book.book_authors << book_author
        end
      end
      
      # get dates
      doc.xpath('//xmlns:originInfo/xmlns:dateIssued').each do |dateIssued|
        if dateIssued.attr('point').to_s == 'start'
          book.start_date = dateIssued.text
        elsif dateIssued.attr('point').to_s == 'end'
          book.end_date = dateIssued.text
        end        
      end
      
      # Get publisher
      book.publisher = nil
      book.publisher = doc.xpath('//xmlns:originInfo/xmlns:publisher').text unless doc.xpath('//xmlns:originInfo/xmlns:publisher').text.empty?
      
      # Get Language
      book.language = nil
      book.language = Language.find_or_create_by_code(doc.xpath('//xmlns:language/xmlns:languageTerm').text) unless doc.xpath('//xmlns:language/xmlns:languageTerm').text.empty?
      
      # Get note
      book.note = nil
      book.note = doc.xpath('//xmlns:note').text unless doc.xpath('//xmlns:note').text.empty?
      
      # Get edition
      book.edition = nil
      book.edition = doc.xpath('//xmlns:originInfo/xmlns:edition').text unless doc.xpath('//xmlns:originInfo/xmlns:edition').text.empty?
      
      # Get format_extent
      book.format_extent = nil
      book.format_extent = doc.xpath('//xmlns:physicalDescription/xmlns:extent').text unless doc.xpath('//xmlns:physicalDescription/xmlns:extent').text.empty?
      
      # Saving mods
      book.mods = book_metadata
      
      # Clear locations
      book.locations.clear
      # Download Places
      doc.xpath('//xmlns:originInfo/xmlns:place').each do |place|
        if place.xpath('.//xmlns:placeTerm').attr('type').to_s == 'text'
          loc = Location.find_or_create_by_formatted_address(place.xpath('.//xmlns:placeTerm').text)
          book.locations << loc
        end
      end
      
      # Clear subjects
      book.subjects.clear
      # check for authors
      doc.xpath('//xmlns:subject').each do |subject|
        subject.children.each do |child_node|
          subject_type = SubjectType.find_or_create_by_name(child_node.name)
          subject = Subject.find_or_create_by_name(child_node.text)
          book.book_subjects << BookSubject.new(:subject => subject, :book => book, :subject_type => subject_type)                     
        end
      end
      
      # reset fail parameter
      book.fill_metadata_fail = 0
                  
      book.save
      
      return true
    end
    
    private
    
    def self.get_title(title_info)
      title = []
      
      title << title_info.xpath(".//xmlns:nonSort").text unless title_info.xpath(".//xmlns:nonSort").text.empty?
      title << title_info.xpath(".//xmlns:title").text unless title_info.xpath(".//xmlns:title").text.empty?
      title << title_info.xpath(".//xmlns:subTitle").text unless title_info.xpath(".//xmlns:subTitle").text.empty?
      title << title_info.xpath(".//xmlns:partNumber").text unless title_info.xpath(".//xmlns:partNumber").text.empty?
      title << title_info.xpath(".//xmlns:partName").text unless title_info.xpath(".//xmlns:partName") .text.empty?
      
      return title.join(' ')
    end
    
    def self.get_name(name)
      name_string = []
      name.xpath('.//xmlns:namePart').each do |name_part|
        name_string << name_part.text
      end
      
      return name_string.join(', ')
    end        
  end
end