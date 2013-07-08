module BooksHelper
  def list_names(search_query)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => search_query, :facet => true, 'facet.field' => 'name_ss', 'rows' => 0
    tagged_names = []
    response.facets.first.items.each do |item|
      tagged_names << {:name => item.value, :count => item.hits}
    end
    tagged_names
  end
end
