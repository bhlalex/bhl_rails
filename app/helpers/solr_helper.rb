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
      else
        field = "#{field}_igss"        
    end   
    field
  end
  def solr_autocomplete(field,term, limit)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    facet_type = get_autocomplete_field(field)
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => facet_type, 'facet.limit' => limit, 'facet.prefix' => term.downcase, 'rows' => 0
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
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => facet_type, 'facet.prefix' => prefix, 'rows' => 0
    response.facets.first.items
  end
end