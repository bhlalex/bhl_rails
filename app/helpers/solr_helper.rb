module SolrHelper
  private
  def get_facet_field(field)
    case field
      when 'language'
        field = 'bok_language_s'
      when 'title'
        field = 'bok_title_ss'
      when 'publisher'
        field = 'bok_publisher_s'
      when 'published_on'
        field = 'bok_start_date_s'  
      else
        field = "#{field}_ss"        
      end   
      field
  end
  
  def get_autocomplete_field(field)
    case field
      when 'language'
        field = 'bok_language_igs'
      when 'title'
        field = 'bok_title_igss'
      when 'publisher'
        field = 'bok_publisher_igs'
      when 'published_on'
        field = 'bok_start_date_igs'  
      else
        field = "#{field}_igss"
    end   
    field
  end
  def solr_autocomplete(field,term, limit)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    facet_type = get_autocomplete_field(field)
    response = rsolr.find :q => "*:*", :fl => "vol_jobid", :facet => true, 'facet.field' => facet_type, 'facet.limit' => limit, 'facet.prefix' => term.downcase, 'rows' => 0
    response.facets.first.items
  end
  
  def solr_search (query, returns)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => query, :fl => returns, :start => 0, :limit => 1
    response['response']['docs'][0]    
  end
  
  def solr_find_document(query)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => query, :start => 0, :limit => 1
    response['response']['docs'][0]
  end
    
  def list_facet_by_prefix(type, prefix)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    facet_type = get_facet_field(type)
    response = rsolr.find :q => "*:*", :fl => "vol_jobid", :facet => true, 'facet.field' => facet_type, 'facet.limit' => 1000000, 'rows' => 0
    res = []
    response.facets.first.items.each do |item|
      res << item if item.value.downcase.start_with?(prefix.downcase)
    end
    res
  end
  
  def get_count_of
    # rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # #facet_type = get_facet_field(type)
    # facet_array = ["author_ss", "name_ss"]        
    # response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => facet_array,'facet.limit' => 1000000, 'rows' => 0
    # #response = rsolr.get 'books_metadata/select', :params => {:q => "*:*", :facet => true, 'facet.field' => facet_type,'facet.limit' => 1000000, 'rows' => 0}
    # count_result = {"books" => response['response']['numFound'], "authors" => response["facet_counts"]["facet_fields"]["author_ss"].count/2,
                    # "names" => response["facet_counts"]["facet_fields"]["name_ss"].count/2}
    #if type == "book"
      #counts["books"] = response['response']['numFound']
    #else
      #response["facet_counts"]["facet_fields"]["author_ss"].count/2
    #end
    
    # read bhl statistics from db (it takes a lot of time to read it from solr)
    bhl_statistic = BhlStatistic.last
    if bhl_statistic
      count_result = {"books" => bhl_statistic.books_count, "authors" => bhl_statistic.authors_count, "names" => bhl_statistic.species_count}
    else
      count_result = {"books" => 0, "authors" => 0, "names" => 0}
    end
  end
end
