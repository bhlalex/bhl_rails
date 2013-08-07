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
  
  def list_facet_by_prefix(type, prefix)
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    facet_type = get_facet_field(type)
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => facet_type, 'facet.prefix' => prefix, 'rows' => 0
    response.facets.first.items
  end
end