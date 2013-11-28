module BooksHelper
  def facet_list(response, field)
    list = []
    response.facets.each do |facet|
      if facet.name == field
        facet.items.each do |item|
          if (item.hits) > 0
            list << {:name => item.value, :count => item.hits}
          end
        end
        break
      end
    end
    list
  end
  
  def item_count (type, item)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => type + ":" + item}
    search['response']['numFound']
  end
  
  def item_count_format (type, item)
    format = item + ' (' + item_count(type, item).to_s + ')'
  end
  
  #for displaying highlighted items with count resulted from solr search
  def item_count_format_highlight (type, item, display)
    format = display.html_safe + ' (' + item_count(type, item).to_s + ')'
  end
  
  def book_names (vol_jobid)
    names = Name.find_by_sql("
      SELECT names.*, COUNT(page_names.name_id) as count
                FROM names
                  INNER JOIN page_names ON (page_names.name_id = names.id)
                  INNER JOIN pages ON(page_names.page_id = pages.id)
                  INNER JOIN volumes ON (volumes.id = pages.volume_id)
                  WHERE volumes.job_id = #{vol_jobid}
                  GROUP BY name_id 
                  ORDER BY count DESC
                  LIMIT 0,#{MAX_NAMES_PER_BOOK}
    ")
  end
  
  def book_names_count_format (vol_jobid)
    names = Name.find_by_sql("
      SELECT COUNT(DISTINCT(names.id)) as count
      FROM names
        INNER JOIN page_names ON (page_names.name_id = names.id)
        INNER JOIN pages ON(page_names.page_id = pages.id)
        INNER JOIN volumes ON (volumes.id = pages.volume_id)
       WHERE volumes.job_id = #{vol_jobid}
    ")
    more_names = ''
    if names[0].count > MAX_NAMES_PER_BOOK
      more_names = " and #{names[0].count - MAX_NAMES_PER_BOOK} more..."
    end
  end
  
  def name_tip (job_id, id, string, eol_thumb, eol_page_id)
    title_tip = ''
    if eol_thumb != nil
      thumb = ATTACHMENTS_URL + THUMB_FOLDER + eol_thumb
      title_tip = "<div style='float:left'>  
                    <img style='height:100px' src='#{thumb}'></img>
                   </div>"
    end
    title_tip += "<div style='float:left'>
                    <span >#{string}</span>
                    <ul>  
                      <li><a href='../books/#{job_id}/read'>Find in the book</a>"
    if eol_page_id != nil && eol_page_id > -1
      title_tip += "<li><a href='http://eol.org/pages/#{eol_page_id}'>View in EOL.org</a>"
    end
    title_tip += "<li><a href='../books?_name=#{string}'>Books with name</a>
                    </ul>
                  </div>"    
    title_tip
  end
  
  #fixing books page url to allow reading the params sent by Dar team for search
  def fix_dar_url(params)
    tmp = {}
    params.each do |key,value|
      if(key.to_s == "title" || key.to_s == "language" || key.to_s == "subject")
        tmp["_#{key.to_s}".to_sym] = value
        params.delete(key)
        break
      elsif(key.to_s == "authorName")
        tmp[:_author] = value
        params.delete(key)
        break
      end
    end
    params.reverse_merge!(tmp)
  end
  def set_query_array(query_array, params)
    query_array.each do  |key, value|
      query_array[key] = params["_#{key}".to_sym] ? params["_#{key}".to_sym].split(' _AND ') : ''
    end
    query_array
  end
  
  def searchAllQuery(query_array)
    query = ''
    string = ''
    query_array['ALL'].each do |value|
      query += query == '' ? "(bok_title:#{value} OR bok_language:#{value} OR published_at:#{value} " +
          "OR geo_location:#{value} OR author:#{value} OR name:#{value} OR subject:#{value} OR content:#{value}) "
          : " AND (bok_title:#{value} OR bok_language:#{value} OR published_at:#{value} OR geo_location:#{value} " + 
          "OR author:#{value} OR name:#{value} OR subject:#{value} OR content:#{value}) "
    end
    query
  end
  
  def set_query_string(query_array, urlOrSolr)
    query = ''
    emptyQuery = true
    query_array.each do |key, value|
      if(value != '')
        emptyQuery = false
        break
      end
    end
    if(emptyQuery && !urlOrSolr)
      query = "*:*"
    else
      if(query_array['ALL'] != '')
        if(urlOrSolr)
          query = "_ALL="
          count = 0
          query_array['ALL'].each do |value|
            query += count == 0 ? value : " _AND #{value} "
            count += 1
          end
        else
          query = searchAllQuery(query_array)
        end
      end
      query_array.each do |key, value|
        if(key == 'ALL')
          next         
        end
        if(key == 'date' && value != '')
          if(!urlOrSolr)
            dates = value[0].split(' - ')
            from = dates[0]
            to = dates[1]
            query += query == '' ? '' : ' AND '
            query += "bok_start_date:[#{from}-01-01T00:00:00Z TO #{to}-01-01T00:00:00Z]"
          else
            query += query == '' ? '' : '&'
            query += " _date=#{value[0]}"
          end
          continue
        end
        if(value != '')
          if(urlOrSolr)  #preparing url string
            tmp = "_#{key}"
            query += query == '' ? "#{tmp}=" : "&#{tmp}="
          else  #preparing solr query
            tmp = (key == 'title' || key == 'language') ? "bok_#{key}" : "#{key}"
            query += query == '' ? "#{tmp}:" : " AND #{tmp}:"
          end
          count = 0
          value.each do |val|
            query += count == 0 ? (urlOrSolr ? val.gsub('/\s\s+/', ' ') : '(' + val.gsub('/\s\s+/', ' ').gsub(' ',' AND '))
            : urlOrSolr ? " _AND " + val.gsub('/\s\s+/', ' ') : " AND " + val.gsub('/\s\s+/', ' ').gsub(' ',' AND ')
            count += 1
          end
          query += !urlOrSolr ? ')' : ''
        end
      end     
    end
    query
  end
  
  def search_facet_highlight(query, page)
    facet_array = ['author_ss', 'bok_language_s', 'subject_ss', 'published_at_ss', 'geo_location_ss' ,'name_ss']
    hl_array = ['bok_title','bok_language','name','published_at', 'geo_location', 'subject','author']
    return_field = "vol_jobid,bok_title,name,author,published_at"
    limit = PAGE_SIZE
    start = (page > 1) ? (page - 1) * limit : 0
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => query, :facet => true, :fl => return_field, :start => start, :limit => limit,
      :hl => true, 'hl.fl' => hl_array, 'hl.simple.pre' => HLPRE, 'hl.simple.post'=> HLPOST, 'hl.requireFieldMatch'=> true,  #only highlight as the query suggest
      #'facet.date'=> 'bok_start_date', 'facet.date.start' =>'1500-01-01T00:00:00Z',
      #'facet.date.end' => '2020-01-01T00:00:00Z', 'facet.date.gap' => "+20YEAR",
      'facet.field' => facet_array, 'facet.mincount' => "1", 'facet.limit' => "4"
  end
  
  def addFacetSearch(params, type, field)
    tmp_params = params.clone
    if (tmp_params["_#{type}".to_sym] != nil && tmp_params["_#{type}".to_sym] != '')
      tmp_params["_#{type}".to_sym] = field + " _AND " + tmp_params["_#{type}".to_sym]
    else
      tmp_params["_#{type}".to_sym] = field
    end
    tmp_params[:controller] = nil
    tmp_params[:action] = nil
    tmp_params[:page] = nil
    tmp_params
  end
  
  def removeBreadCrumb(params, type, field)
    tmp_params = params.clone
    if (tmp_params["_#{type}".to_sym].include?("#{field} _AND "))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub("#{field} _AND ", '')
    elsif (tmp_params["_#{type}".to_sym].include?(" _AND #{field}"))
      tmp_params["_#{type}".to_sym] = tmp_params["_#{type}".to_sym].gsub(" _AND #{field}", '')
    elsif (tmp_params["_#{type}".to_sym] == field)
      tmp_params.delete("_#{type}".to_sym)      
    end
    tmp_params[:controller] = nil
    tmp_params[:action] = nil
    tmp_params[:page] = nil
    tmp_params
  end
  
  def fillResponseArrays(doc, highlight, type, id)
    counter = 1
    array = []
    if(doc[type].length > 1)
      doc[type].each do |term|
        if(counter > MAX_NAMES_PER_BOOK)
          break
        else
          array << term
          counter += 1
        end
      end
    else
      array << doc[type]
    end
    
    if (highlight != nil && highlight[type] != nil)
      highlight[type].each do |hl_term|
        key = array.index(hl_term.gsub(HLPRE, '').gsub(HLPOST, ''))
        if(key == nil)
          array << hl_term
        else
          array[key] = hl_term
        end
      end
    end
    array
  end
  
  def searchParam(params)
    tmp_params = params.clone
    if (tmp_params[:books] != nil && tmp_params[:books]["searchby"] != nil)
      tmp_params[:books].delete("searchby")
    end
    tmp_params.delete("utf8")
    tmp_params
  end
  
  def search_view(params, view)
    params[:view] = view
    params[:controller] = nil
    params[:action] = nil
    params
  end

  def generateHRef(pageNumber, params)
    tmp_params = params.clone
    controller = params[:controller]
    tmp_params[:controller] = nil
    tmp_params[:page] = pageNumber
    tmp_params[:action] = nil
    tmp_params
  end
  
  def visited_volume?(user_history, vol)
    user_history.each do |row|
      return true if row[:volume_id] == vol[:id] 
    end
    return false
  end

    
def related_books(volume_id)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    origin_book_names = rsolr.find :q => "vol_jobid:(#{volume_id})", :fl => "name"
    return_field = "vol_jobid,bok_title,name"
    query = "bok_title:(#{Book.find_by_id(Volume.find_by_job_id(params[:id]).book_id).title})"
    if (origin_book_names['response']['docs'][0]['name'].any?)
      query+= " OR name:("
      origin_book_names['response']['docs'][0]['name'].each do |name|
        query+= "#{name} OR "
      end
     query = query[0,query.length-4]
     query+= ")"
  end
     response = rsolr.find :q => query, :fl => return_field, 'rows' => 5
  end

  def also_viewed_ids(id, limit)
    ids = BookView.find_by_sql("SELECT result.rel_id, COUNT(*) as total_count
                            FROM (
                                (SELECT book_id1 AS rel_id 
                                FROM book_views
                                WHERE book_id2 = #{id})
                                UNION(SELECT book_id2 AS rel_id
                                FROM book_views
                                WHERE book_id1 = #{id})
                            ) result
                            GROUP BY result.rel_id ORDER BY total_count DESC
                            LIMIT 0, #{limit};")
  end
  def also_viewed_volumes(ids)
    results = []
    ids.each do |item|
      results << solr_search("vol_jobid:#{item['rel_id']}", "vol_jobid, bok_title, bok_language, subjects, ")
    end
    results   
  end
end
