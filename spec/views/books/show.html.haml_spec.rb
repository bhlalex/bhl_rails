require 'spec_helper'

describe "books/show.html.haml" do
  before(:all) do
    truncate_table(ActiveRecord::Base.connection, "books", {})
    truncate_table(ActiveRecord::Base.connection, "volumes", {})
    
    doc = {:vol_jobid => "123", :bok_bibid => "456"}
    doc[:bok_title] = "Test Book"
    doc[:name] = "Test Name"
    
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    # remove this book if exists
    solr.delete_by_query('vol_jobid:123')
    solr.commit
    solr.add doc
    solr.commit
    
    book = Book.gen(:title => "Test Book", :bibid => "456", :mods => "<xml>xml content</xml>")
    volume = Volume.gen(:book => book, :job_id => 123)
  end
  
  it 'should contain tabs' do
    visit "/books/123/brief"
    page.should have_content(I18n.t(:brief))
    page.should have_content(I18n.t(:mods))
    page.should have_content(I18n.t(:bibtex))
    page.should have_content(I18n.t(:endnote))
  end
  
  it 'should contain book title' do
    visit "/books/123/brief"
    page.should have_content("Test Book")
  end
  
  it 'should load mods' do
    visit "/books/123/mods"
    page.should have_content("xml content")
  end
end