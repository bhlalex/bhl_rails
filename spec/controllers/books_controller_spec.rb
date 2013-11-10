require 'spec_helper'

describe BooksController do
  
  render_views
  
  describe "all" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    
    
  end

  describe "GET 'show'" do
    before(:all) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:123')
      solr.commit
      solr.add doc
      solr.commit
      
      @book = Book.gen(:title => "Test Book", :bibid => "456", :mods => "<xml>xml content</xml>")
      @volume = Volume.gen(:book => @book, :job_id => 123)
        
      doc = {:vol_jobid => "1234", :bok_bibid => "4567"}
      doc[:bok_title] = "Test Book 2"
      doc[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      #doc[:name]= "Gymnospermae"  
      doc[:bok_language] = "English"
      doc[:bok_start_date] = '1838-01-01T00:00:00Z'
      doc[:bok_publisher] = "The Society"
      doc[:subject] = ["one", "two", "three", "four", "five"]
      doc[:geo_location] = ["location"]
      doc[:author] = ["author1", "author2"]
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:1234')
      solr.commit
      solr.add doc
      solr.commit
      
      @book_with_parameters = Book.gen(:title => "Test Book 2", :bibid => "4567", :mods => "<xml>xml content</xml>")
      @volume_with_parameters = Volume.gen(:book => @book_with_parameters, :job_id => 1234)
      
      doc = {:vol_jobid => "12345", :bok_bibid => "45678"}
      doc[:bok_title] = "Test Book 3"
      doc[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:12345')
      solr.commit
      solr.add doc
      solr.commit
      
      @book_with_one_name= Book.gen(:title => "Test Book 3", :bibid => "45678", :mods => "<xml>xml content</xml>")
      @volume_with_one_name = Volume.gen(:book => @book_with_parameters, :job_id => 12345)
         
    end

    it "should be successful" do
      get 'show', :id => "123"
      response.should be_success
    end
    
    describe "title" do
      it "should have the right book title" do
        get 'show', :id => "123"
        response.should have_content("#{@book[:bok_title]}")
      end
    end
      
    describe "right panel" do
      it "should have read book button links to the read book page" do
        get 'show', :id => "123"
        response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/read", :content => I18n.t(:read_book_link))
      end
      
      it "should have an image for the book" do
        get 'show', :id => "123"
        response.should have_selector("img", :src => src="/volumes/#{@volume[:job_id]}/thumb.jpg" )
      end
      
      it "should display book image" do
        lambda do
          get "/volumes/#{@volume[:job_id]}6/thumb.jpg"
        end.should_not raise_error
      end
    end
      
  describe "tabs links" do
    it "should link to brief" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/brief", :content => I18n.t(:brief))
    end
    
    it "should link to mods" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/mods", :content => I18n.t(:mods))
    end
        
    it "should link to bibtex" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/bibtex", :content => I18n.t(:bibtex))
    end
        
    it "should link to endnote" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/endnote", :content => I18n.t(:endnote))
    end
  end
  
  describe "Brief tab" do
    
    it "should display language only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_language_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_language_title))
    end
    
    it "should display date only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_date_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_date_title))
    end
    
    it "should display publisher only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_publish_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_publish_title))
    end
    
    it "should display author only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_author_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_author_title))
    end
    
    it "should display publication place only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_publish_place_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_publish_place_title))
    end

    it "should display Genre only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_subject_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_subject_title))
    end

    it "should display book name only if it exists in the meta data" do
      get 'show', :id => "123"
      response.should_not have_selector("b", :content => I18n.t(:book_name_title))
      get 'show', :id => "1234"
      response.should have_selector("b", :content => I18n.t(:book_name_title))
    end
    
    it "should not contains 'and more' when names are less than 5" do
      get 'show', :id => "12345"
      response.should_not have_selector("li", :content => "more")
    end
    
    it "should contains 'and more' with the correct number when names are greater than 5" do 
      get 'show', :id => "1234"
      response.should have_selector("span", :content => "and 2 more...")
    end
  end
  
  describe "mods tab" do
    
    it "should contains the right content" do
      get 'show', :id => "123", :tab => "mods"
      response.should have_selector("pre", :content => "#{@book[:mods]}")
    end
  end
  end
end