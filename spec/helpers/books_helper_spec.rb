$LOAD_PATH << './lib/'
require 'spec_helper'
require 'solr_indexer'

describe BooksHelper do
  it 'should return at least one name' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:name] = "Test Name"
    
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit
    
    response = search_facet_highlight('vol_jobid:123', 1)
    list = facet_list(response, 'name_ss')
    list.should include(:name => "Test Name", :count => 1)    
    
    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end
  
  it 'should return at least one language' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:bok_language] = "Test Language"
    
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit
    
    response = search_facet_highlight('vol_jobid:123', 1)
    list = facet_list(response, 'bok_language_s')
    list.should include(:name => "Test Language", :count => 1)    
    
    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end
  
  it 'should return at least one author' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:author] = "Test Author"
    
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit
    
    response = search_facet_highlight('vol_jobid:123', 1)
    list = facet_list(response, 'author_ss')
    list.should include(:name => "Test Author", :count => 1)    
    
    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end
end