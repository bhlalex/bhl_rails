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
    
    list = list_names('vol_jobid:123')
    list.should include(:name => "test name", :count => 1)    
    
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
    
    list = list_languages('vol_jobid:123')
    list.should include(:name => "test language", :count => 1)    
    
    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end
end
