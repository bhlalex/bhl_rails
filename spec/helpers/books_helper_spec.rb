$LOAD_PATH << './lib/'
require 'spec_helper'
require 'solr_indexer'

describe BooksHelper do
  it 'should return at least one name' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:name] = "Test Name"
    doc[:single_bok_title] = "title"
      
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit

    response = search_facet_highlight('vol_jobid:123', 1,'')
    list = facet_list(response, 'name_ss')
    list.should include(:name => "Test Name", :count => 1)

    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end

  it 'should return at least one language' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:bok_language] = "Test Language"
    doc[:single_bok_title] = "title"
      
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit

    response = search_facet_highlight('vol_jobid:123', 1,'')
    list = facet_list(response, 'bok_language_s')
    list.should include(:name => "Test Language", :count => 1)

    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end

  it 'should return at least one author' do
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:author] = "Test Author"
    doc[:single_bok_title] = "title"
      
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit

    response = search_facet_highlight('vol_jobid:123', 1,'')
    list = facet_list(response, 'author_ss')
    list.should include(:name => "Test Author", :count => 1)

    solr.delete_by_query('vol_jobid:123')
    solr.commit
  end

  # test sorting books by rate and number of views
  describe "sort books" do
    before(:each) do
      # insert to two books with different values of rate and views to test sorting
      @doc1 = {:vol_jobid => "123", :bok_bibid => "456"}
      @doc1[:bok_title] = "Test Book1"
      @doc1[:name] = "Test Name"
      @doc1[:rate] = 2.9 # lower rate
      @doc1[:views] = 1 # higher number of views
      @doc1[:single_bok_title] = "title"
        
      @doc2 = {:vol_jobid => "124", :bok_bibid => "456"}
      @doc2[:bok_title] = "Test Book2"
      @doc2[:name] = "Test Name"
      @doc2[:rate] = 4 # higher rate
      @doc2[:views] = 0 # lower number of views
      @doc2[:single_bok_title] = "title"
        
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      solr.add @doc1
      solr.commit
      solr.add @doc2
      solr.commit

    end
    it 'should sort by rate desc' do
      # order of returned books should be according to the value of rate decs
      @response = search_facet_highlight('*:*', 1,'rate desc')
      first_doc = @response['response']['docs'][0]['vol_jobid']
      second_doc = @response['response']['docs'][1]['vol_jobid']
      @doc2[:vol_jobid].to_i.should eq(first_doc) # having higher value of rate should returned first
      @doc1[:vol_jobid].to_i.should eq(second_doc) # having lower value of rate should returned second
    end

    it 'should sort by rate asc' do
      # order of returned books should be according to the value of rate asc
      @response = search_facet_highlight('*:*', 1,'rate asc')
      first_doc = @response['response']['docs'][0]['vol_jobid']
      second_doc = @response['response']['docs'][1]['vol_jobid']
      @doc1[:vol_jobid].to_i.should eq(first_doc) # having lower value of rate should returned first
      @doc2[:vol_jobid].to_i.should eq(second_doc)# having higher value of rate should returned second
    end

    it 'should sort by views desc' do
      # order of returned books should be according to the value of views desc
      @response = search_facet_highlight('*:*', 1,'views desc')
      first_doc = @response['response']['docs'][0]['vol_jobid']
      second_doc = @response['response']['docs'][1]['vol_jobid']
      @doc1[:vol_jobid].to_i.should eq(first_doc) # having higher value of views should returned first
      @doc2[:vol_jobid].to_i.should eq(second_doc) # having lower value of views should returned second
    end

    it 'should sort by views asc' do
      # order of returned books should be according to the value of views asc
      @response = search_facet_highlight('*:*', 1,'views asc')
      first_doc = @response['response']['docs'][0]['vol_jobid']
      second_doc = @response['response']['docs'][1]['vol_jobid']
      @doc2[:vol_jobid].to_i.should eq(first_doc) # having lower value of views should returned first
      @doc1[:vol_jobid].to_i.should eq(second_doc) # having higher value of views should returned second
    end
  end
end