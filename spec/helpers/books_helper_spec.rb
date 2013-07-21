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
    
    list = facet_list('vol_jobid:123', 'name_ss')
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
    
    list = facet_list('vol_jobid:123', 'bok_language_s')
    list.should include(:name => "test language", :count => 1)    
    
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
    
    list = facet_list('vol_jobid:123', 'author_ss')
    list.should include(:name => "test author", :count => 1)    
    
    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end
end