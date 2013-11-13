require 'spec_helper'

describe BooksController do
<<<<<<< HEAD
  render_views
  include BooksHelper
  describe "GET 'index'" do

    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})

      @name1 = Name.gen(:string => "sci1")
      @name2 = Name.gen(:string => "sci2")
      @name3 = Name.gen(:string => "sci3")

      doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
      doc_test_first[:bok_title] = "Test Book First"
      doc_test_first[:name] = ["Name1","Name2"]
      doc_test_first[:author] = "Author"
      doc_test_first[:bok_language]="English"
      doc_test_first[:geo_location]="Egypt"
      doc_test_first[:subject]="subject"

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:123')
      solr.commit
      solr.add doc_test_first
      solr.commit

      @book_test_first = Book.gen(:title => 'Test Book second', :bibid => '456')
      @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)
      @page_first = Page.gen(:volume => @vol_first )

      doc_test_second = {:vol_jobid => "238233", :bok_bibid => "456"}
      doc_test_second[:bok_title] = "Test Book Second"
      doc_test_second[:name] = ["Name2","Name3"]
      doc_test_second[:author] = "Author"
      doc_test_second[:bok_language]="English"
      doc_test_second[:geo_location]="Egypt"
      doc_test_second[:subject]="subject"

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:238233')
      solr.commit
      solr.add doc_test_second
      solr.commit

      @book_test_second = Book.gen(:title => 'Test Book second', :bibid => '456')
      @vol_second = Volume.gen(:book => @book_test_second, :job_id => '238233', :get_thumbnail_fail => 0)
      @page_second = Page.gen(:volume => @vol_second )

      PageName.gen(:page => @page_second, :name => @name2, :namestring => "Name2")
      PageName.gen(:page => @page_second, :name => @name3, :namestring => "Name3")
      PageName.gen(:page => @page_first, :name => @name1, :namestring => "Name1")
      PageName.gen(:page => @page_first, :name => @name2, :namestring => "Name2")
    end

    # check for existance of image for each book in gallery view
    it "should have an image for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
      response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
    end

    # check for existance of image for each book in gallery view
    it "should have an image for each book in gallery view" do
      get :index, :view => "gallery"
      response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
      response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
    end

    # check for books count
    it "should return item count equal to the total number of books" do
      get :index
      response.should have_selector("div", :class => "count", :content => 2.to_s)
    end

=======
  
  render_views
  
  describe "all" do
>>>>>>> 83a72abff4fb9a88ab9a7843cd8c9b8f02d36378
    it "returns http success" do
      get :index
      response.should be_success
    end
<<<<<<< HEAD

    # check for existance of detail link for each book in list view
    it "should return detail link for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a', :href => "/books/123" ,:content => "Test Book First")
      response.should have_selector('a', :href => "/books/238233", :content => "Test Book Second")
    end

    # check for existance of detail link for each book in gallery view
    it "should return detail link for each book in gallery view" do
      get :index, :view => "gallery"
      response.should have_selector('a', :href => "/books/123" ,:content => "Test Book First")
      response.should have_selector('a', :href => "/books/238233", :content => "Test Book Second")
    end

    # check for existance of read and detail links for each book in list view
    it "should return read and detail links for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a', :href => "/books/123/read")
      response.should have_selector('a', :href => "/books/123")
      response.should have_selector('a', :href => "/books/238233/read")
      response.should have_selector('a', :href => "/books/238233")
    end

    # check for existance of read and detail images for each book in list view
    it "should return read and detail images for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('img', :src => "/images_en/read.png")
      response.should have_selector('img', :src => "/images_en/learn.png")
    end

    # check for existance of open link for each author with the count of books for each author
    it "should have open links for authors" do
      get :index
      response.should have_selector('a', :href => "/books?_author=Author", :content => "Author [2]")
    end

    # check for existance of open link for each names with the count of books for each name
    it "should have open links for names" do
      get :index
      response.should have_selector('a', :href => "/books?_name=Name1", :content => "Name1 [1]")
      response.should have_selector('a', :href => "/books?_name=Name2", :content => "Name2 [2]")
      response.should have_selector('a', :href => "/books?_name=Name3", :content => "Name3 [1]")
    end

    # check for existance of open link for each language with the count of books for each language
    it "should have open links for languages" do
      get :index
      response.should have_selector('a', :href => "/books?_language=English", :content => "English [2]")
    end

    # check for existance of open link for each location with the count of books for each location
    it "should have open links for geo locations" do
      get :index
      response.should have_selector('a', :href => "/books?_geo_location=Egypt", :content => "Egypt [2]")
    end

    # check for existance of open link for each subject with the count of books for each subject
    it "should have open links for subjects" do
      get :index
      response.should have_selector('a', :href => "/books?_subject=subject", :content => "subject [2]")
    end

    # check for existance of the search bar
    it "should have a search bar" do
      get :index
      response.should have_selector("div", :class => "searchtitle")
    end

    # check for existance of the pagination bar
    it "should have a pagination bar" do 
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      22.times{ |i|
            doc_test = {:vol_jobid => i.to_s, :bok_bibid => "456"}
            doc_test[:bok_title] = "Test Book"
            #doc_test_first[:name] = "Test Name"
            doc_test[:author] = "Author"
            doc_test[:bok_language]="English"
            doc_test[:geo_location]="Egypt"
            doc_test[:subject]="subject"
            
            # remove this book if exists
            solr.delete_by_query('vol_jobid:'+i.to_s)
            solr.commit
            solr.add doc_test
            solr.commit  
            @book_test = Book.gen(:title => 'Test Book', :bibid => '456')
            Volume.gen(:book => @book_test, :job_id => i.to_s, :get_thumbnail_fail => 0)
      }
      get :index
      response.should have_selector("ul", :id => "pagination") 
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      22.times{ |i| Volume.delete(i) }
    end

    # check for existance of gallery and list view options
    it "should have links for gallery and list views" do
      get :index
      response.should have_selector("a", :href => "/books?view=gallery")
      response.should have_selector("a", :href => "/books?view=list")
    end

    it "should have images for gallery and list views" do
      get :index
      response.should have_selector("img", :src => "/images_en/list.png")
      response.should have_selector("img", :src => "/images_en/gallery.png")
    end

    # check for existance of the right column
    it "should have the right column" do
      get :index
      response.should have_selector("h3", :content => "TAGGED SPECIES")
      response.should have_selector("h3", :content => "LANGUAGES")
      response.should have_selector("h3", :content => "AUTHORS")
      response.should have_selector("h3", :content => "REGIONAL AFFILIATION")
      response.should have_selector("h3", :content => "GENRE")
    end

    # check for existance of By:authors label in list view
    it "should have by author" do
      get :index, :view => "list"
      response.should have_selector("div", :class => "description", :content => "By")
    end

    # check for existance div.gallery in gallery view
    it "should have gallery div" do
      get :index, :view => "gallery"
      response.should have_selector("div", :class => "gallery")
    end

=======
    
    
  end

  describe "GET 'show'" do
    before(:all) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})
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
      @Page = Page.gen(:volume => @volume_with_parameters)
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring0" ), :namestring => "teststring0")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring1" ), :namestring => "teststring1")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring2" ), :namestring => "teststring2")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring3" ), :namestring => "teststring3")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring4" ), :namestring => "teststring4")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring5" ), :namestring => "teststring5")
      PageName.create(:page => @Page, :name => Name.gen(:string => "teststring6" ), :namestring => "teststring6")
#      
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
    
    #TODO recheck after fixing this bug
#    it "should contains 'and more' with the correct number when names are greater than 5" do 
#      get 'show', :id => "1234"
#      response.should have_selector("span", :content => "and 2 more...")
#    end
  end
  
  describe "mods tab" do
    
    it "should contains the right content" do
      get 'show', :id => "123", :tab => "mods"
      response.should have_selector("pre", :content => "xml content")
    end
  end
>>>>>>> 83a72abff4fb9a88ab9a7843cd8c9b8f02d36378
  end
end
