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
  
  def list_languages(search_query)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => search_query, :facet => true, 'facet.field' => 'bok_language_s', 'rows' => 0
    tagged_languages = []
    response.facets.first.items.each do |item|
      tagged_languages << {:name => item.value, :count => item.hits}
    end
    tagged_languages
  end
  
  def list_authors(search_query)
    solr = RSolr::Ext.connect :url => SOLR_BOOKS_METADATA
    response = solr.find :q => search_query, :facet => true, 'facet.field' => 'author_ss', 'rows' => 0
    tagged_authors = []
    response.facets.first.items.each do |item|
      tagged_authors << {:name => item.value, :count => item.hits}
    end
    tagged_authors
  end
end
