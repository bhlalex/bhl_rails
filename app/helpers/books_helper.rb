module BooksHelper
  def item_count (type, item)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search = rsolr.select :params => { :q => type + ":" + item}
    search['response']['numFound']
  end
  
  def item_count_format (type, item)
    format = item + ' (' + item_count(type, item).to_s + ')'    
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
      more_names = " and #{names[0].count} more...";
    end
  end
  
  def name_tip (id, string, eol_thumb)
    title_tip = ''
    if eol_thumb != nil
      thumb = ATTACHMENTS_URL + THUMB_FOLDER + eol_thumb
      title_tip = "<div style='float:left'>  
                    <img style='height:100px' src='#{thumb}' >
                   </div>"
    end
  end   
end