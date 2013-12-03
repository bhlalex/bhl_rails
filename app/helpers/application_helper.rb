module ApplicationHelper
  include BooksHelper
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

  # parse query for displaying
  def parse_query(query_string)
    parsed_query=''
    sub_queries = query_string.split("&")
    if sub_queries.nil?
      parsed_query
    else
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        parsed_query+= "<b>#{I18n.t(terms[0][1,terms[0].length])}</b>: #{terms[1].tr("_", "")}, "
      end
      parsed_query = parsed_query[0,parsed_query.length-2]+"<br />"
    end
  end
  # parse query for displaying

  def parse_url_params(params)
    saved_query=''
    params.each do |key,value|
      saved_query+= key + "=" + value +"&" if(key.include?("_"))
    end
    saved_query[0,saved_query.length-1]
  end

  def parse_collection_status(status)
    if status
      I18n.t(:public)
    else
      I18n.t(:private)
    end
  end
  
  def get_number_of_returned_books(query_string)
    url_params = {}
    sub_queries = query_string.split("&")
    if sub_queries.any?
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        url_params [terms[0].to_sym] = terms[1]
      end
    end
    query_array = {'ALL' => [], 'title'=> [], 'language'=> [], 'published_at'=> [], 'geo_location'=> [],
                       'author'=> [], 'name'=> [], 'subject'=> [], 'content'=> [], 'date'=> []}
    query_array = set_query_array(query_array, url_params)
    query = set_query_string(query_array, false)  
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search =  solr.find :q => query
    search['response']['numFound']
  end

  
  def get_comments(type, collection_id, job_id)
    # (collection_id or job_id), type = "collection, volume"
    if type == "collection"
      comments_list = Comment.where(:collection_id => collection_id)
    else
      volume_id = Volume.find_by_job_id(job_id).id
      comments_list = Comment.where(:volume_id => volume_id)
    end
    comments_replies_list = []
    comments_list.each do |comment|
      comments_replies_list.push(comment)
      replies = Comment.where(:comment_id => comment.id)
      replies.each do |reply|
        comments_replies_list.push(reply)
      end
    end
    comments_replies_list
  end
end
