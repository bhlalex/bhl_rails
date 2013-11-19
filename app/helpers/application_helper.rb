module ApplicationHelper
  def books_count
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # I don't need any rows, I just need the count of all books.
    # So I am faceting on bok_bibid and making returned rows count = 0
    book_count = solr.get 'select', :params => {:q => '*:*', :group => true, 'group.field' => 'bok_bibid', 'rows' => 0}
    book_count["grouped"]["bok_bibid"]["matches"]
  end
  
  def get_authors_count
    get_item_count('author_ss')
  end
  
  def get_languages_count
    get_item_count('bok_language_s')
  end
  
  def get_names_count
    get_item_count('name_ss')
  end
  
  # move this to here as both book and user pages need it
  def adjustPaging (page, lastPage)
   pages = []
   count = 0
   pageCountDisplay = 3
   # 1 2 <3> 4 5
   if(page - pageCountDisplay > 0 && page + pageCountDisplay <= lastPage)
     i = page - pageCountDisplay + 1
     while count < pageCountDisplay * 2 do #for ($i = $page - $pageCountDisplay + 1; $count < $pageCountDisplay * 2; $i++)
       pages << i
       count += 1
       i += 1
     end
   elsif(page - pageCountDisplay <= 0 && page + pageCountDisplay > lastPage) # <1> 2
     i = 2
     while i <= lastPage - 1 do #for($i = 2; $i <= $lastPage - 1; $i++)
       pages << i
       i += 1
     end
   elsif(page - pageCountDisplay <= 0 && page + pageCountDisplay <= lastPage)# <1> 2 3 4 5
     i = 2
     while i < pageCountDisplay * 2 && i < lastPage do #for ($i = 2; $i < $pageCountDisplay * 2 && $i < $lastPage; $i++)
       pages << i
       i += 1
     end
   elsif(page - pageCountDisplay >= 0 && page + pageCountDisplay > lastPage) # 2 3 4 5 <6>
     i = page - pageCountDisplay + 1
     while i <= lastPage - 1 do # for ($i = $page - $pageCountDisplay + 1; $i <= $lastPage-1; $i++)
       pages << i
       i += 1
     end
   end
   pages
 end
   
  private
  def get_item_count(field_name)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    # facet on author_ss, returned rows = 0 
    response = solr.find :q => '*:*', :facet => true, 'facet.field' => field_name, 'rows' => 0
    response.facets.first.items.count
  end

  def parse_query(query_string)
    parsed_query='/books?'
    sub_queries = query_string.split("and")
    sub_queries.each do |sub_query|
      terms = sub_query.split(":")
      parsed_query+= "_" + terms[0] + "=" + terms[1][1..terms[1].length-2]
      parsed_query+= "&" if(sub_queries.length != 1)
    end
    parsed_query
  end
end
