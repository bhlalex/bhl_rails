require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login

describe BooksController do
  render_views
  include BooksHelper
  include BHL::Login

  describe "GET 'index'" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})

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
      doc_test_first[:single_bok_title] = " first title"
      doc_test_first[:rate] = "4"
      doc_test_first[:views] = "5"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*') 
      solr.commit
      solr.add doc_test_first
      solr.commit

      @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)
      @page_first = Page.gen(:volume => @vol_first )

      doc_test_second = {:vol_jobid => "238233", :bok_bibid => "456"}
      doc_test_second[:bok_title] = "Test Book Second"
      doc_test_second[:name] = ["Name2","Name3"]
      doc_test_second[:author] = "Author"
      doc_test_second[:bok_language]="English"
      doc_test_second[:geo_location]="Egypt"
      doc_test_second[:subject]="subject"
      doc_test_second[:single_bok_title] = "second title"
      doc_test_second[:rate] = "5"
      doc_test_second[:views] = "4"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:238233')
      solr.commit
      solr.add doc_test_second
      solr.commit

      @book_test_second = Book.gen(:title => 'Test Book second', :bibid => '456')
      @vol_second = Volume.gen(:book => @book_test_second, :job_id => '238233', :get_thumbnail_fail => 0)
      @page_second = Page.gen(:volume => @vol_second )

      PageName.create(:page => @page_second, :name => @name2, :namestring => "Name2")
      PageName.create(:page => @page_second, :name => @name3, :namestring => "Name3")
      PageName.create(:page => @page_first, :name => @name1, :namestring => "Name1")
      PageName.create(:page => @page_first, :name => @name2, :namestring => "Name2")
    end

    # check for existance of image for each book 
    it "should have an image for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
      response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
    end

    # check for books count
    it "should return item count equal to the total number of books" do
      get :index
      response.should have_selector("h4", :class => "text-muted clearfix", :content => 2.to_s)
    end

    it "returns http success" do
      get :index
      response.should be_success
    end

    # check for existance of detail link for each book
    it "should return details link for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a', :href => "/books/123" ,:content => "Test Book First")
      response.should have_selector('a', :href => "/books/238233", :content => "Test Book Second")
    end

    it "should have add to collection link if user signed in" do
      User.gen() unless User.first
      @user = User.first
      log_out
      log_in(@user)
      get :index
      response.should have_selector("a", :content => I18n.t(:sidelinks_add_collection))
    end
    
    it "should not have add to collection link if user is not signed in" do
      get :index
      response.should_not have_selector("a", :content => I18n.t(:sidelinks_add_collection))
    end
    # check for existance of read and detail links for each book
    it "should return read and detail links for each book in list view" do
      get :index, :view => "list"
      response.should have_selector('a', :href => "/books/123/read")
      response.should have_selector('a', :href => "/books/123")
      response.should have_selector('a', :href => "/books/238233/read")
      response.should have_selector('a', :href => "/books/238233")
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
      response.should have_selector("div", :class => "topsearch")
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
        doc_test[:single_bok_title] = "title"

        # remove this book if exists
        solr.delete_by_query('vol_jobid:'+i.to_s)
        solr.commit
        solr.add doc_test
        solr.commit
        @book_test = Book.gen(:title => 'Test Book', :bibid => '456')
        Volume.gen(:book => @book_test, :job_id => i.to_s, :get_thumbnail_fail => 0)
      }
      get :index
      response.should have_selector("div", :class => "pagination-centered")
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      22.times{ |i| Volume.delete(i) }
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

    # check for existance of By:authors label
    it "should have by author" do
      get :index, :view => "list"
      response.should have_selector("p", :class => "small", :content => "By")
    end
    
    describe "sort books" do
      it "should sort books by rate asc" do
      get :index, :sort_type => "rate asc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_first.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_second.job_id}")
    end
      it "should sort books by rate desc" do
      get :index, :sort_type => "rate desc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_second.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_first.job_id}")
    end
      it "should sort books by views asc" do
      get :index, :sort_type => "views asc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_second.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_first.job_id}")
    end
      it "should sort books by views desc" do
      get :index, :sort_type => "views desc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_first.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_second.job_id}")
    end
      it "should sort books by title asc" do
      get :index, :sort_type => "single_bok_title asc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_first.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_second.job_id}")
    end
      it "should sort books by title desc" do
      get :index, :sort_type => "single_bok_title desc"
        response.should have_selector("div", :id => "book 1", :name => "book #{@vol_second.job_id}")
        response.should have_selector("div", :id => "book 2", :name => "book #{@vol_first.job_id}")
    end
    end

    # save query
    describe 'save queries' do
      it 'should have save query button  if user is logged in and performed search action' do
        truncate_table(ActiveRecord::Base.connection, "users", {})
        user = User.gen
        log_in(user)
        get :index, :title => "Test Book second"
        response.should have_selector('a', :content => "Save Query")
      end
    end
  end

  describe "GET 'autocomplete'" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})

      doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
      doc_test_first[:bok_title] = "Test Book First"
      doc_test_first[:name] = ["sci1","sci2", "sci3"]
      doc_test_first[:author] = "Author"
      doc_test_first[:bok_language]="English"
      doc_test_first[:geo_location]="Egypt"
      doc_test_first[:subject]="subject"
      doc_test_first[:single_bok_title] = "title"

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      # remove this book if exists
      solr.delete_by_query('vol_jobid:123')
      solr.commit
      solr.add doc_test_first
      solr.commit

      @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)
      @page_first = Page.gen(:volume => @vol_first )

      doc_test_second = {:vol_jobid => "238233", :bok_bibid => "456"}
      doc_test_second[:bok_title] = "Test Book Second"
      doc_test_second[:name] = ["Name2","Name3"]
      doc_test_second[:author] = "Author"
      doc_test_second[:bok_language]="English"
      doc_test_second[:geo_location]="Egypt"
      doc_test_second[:subject]="subject"
      doc_test_second[:single_bok_title] = "title"

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('vol_jobid:238233')
      solr.commit
      solr.add doc_test_second
      solr.commit

      @book_test_second = Book.gen(:title => 'Test Book second', :bibid => '456')
      @vol_second = Volume.gen(:book => @book_test_second, :job_id => '238233', :get_thumbnail_fail => 0)
      @page_second = Page.gen(:volume => @vol_second )
    end

    # check for title autocomplete
    it "should return 2 book titles" do
      begin
        get :autocomplete, :type => "title", "term" => "t"
      rescue ActionView::MissingTemplate
        response.should have_content('"test books first", "test book second"]')
        #controller.autocomplete("title", "t", true).should == ["test book first", "test book second"]
      end
    end
  end

  describe "GET 'show'" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book"
      doc[:single_bok_title] = "title"

      

      @book = Book.gen(:title => "Test Book", :bibid => "456", :mods => "<xml>xml content</xml>")
      @volume = Volume.gen(:book => @book, :job_id => 123,:get_thumbnail_fail => 0 )

      doc2 = {:vol_jobid => "1234", :bok_bibid => "4567"}
      doc2[:bok_title] = "Test Book 2"
      doc2[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      doc2[:bok_language] = "English"
      doc2[:bok_start_date] = '1838-01-01T00:00:00Z'
      doc2[:bok_publisher] = "The Society"
      doc2[:subject] = ["one", "two", "three", "four", "five"]
      doc2[:geo_location] = ["location"]
      doc2[:author] = ["author1", "author2"]
      doc2[:single_bok_title] = "title"


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

      doc3 = {:vol_jobid => "12345", :bok_bibid => "45678"}
      doc3[:bok_title] = "Test Book 3"
      doc3[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      doc3[:single_bok_title] = "title"


      @book_with_one_name= Book.gen(:title => "Test Book 3", :bibid => "45678", :mods => "<xml>xml content</xml>")
      @volume_with_one_name = Volume.gen(:book => @book_with_parameters, :job_id => 12345)
      
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc
      solr.commit
      solr.add doc2
      solr.commit
      solr.add doc3
      solr.commit
    end

    it "should add record in history table when visit read tab" do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      truncate_table(ActiveRecord::Base.connection, "user_book_histories", {})
      User.gen() unless User.first
      @user = User.first
      log_out
      log_in(@user)
      history = UserBookHistory.where(:user_id => @user.id)
      history.count.should eq(0)
      get 'show', :id => "123", :tab => :read
      history = UserBookHistory.where(:user_id => @user.id)
      history.count.should eq(1)
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
    
    describe "read book page" do
      
      it "should have book title" do
        get :show, :id => "123", :tab => "read"
        response.should have_selector("h3", :content => "#{@book.title}")
      end
      
      it "should have add to collection link if user signed in" do
        User.gen() unless User.first
        @user = User.first
        log_in(@user)
        get :show, :id => "123", :tab => "read"
        response.should have_selector("a", :content => I18n.t(:read_page_add_collection))
      end
      
      it "should not have add to collection link if user is not signed in" do
        get :show, :id => "123", :tab => "read"
        response.should_not have_selector("a", :content => I18n.t(:read_page_add_collection))
      end
    end
    describe "right panel" do
      it "should have read book button links to the read book page" do
        get 'show', :id => "123"
        response.should have_selector("a", :href => "/books/#{@volume[:job_id]}/read", :content => I18n.t(:sidelinks_read))
      end

      it "should have an image for the book" do
        get 'show', :id => "123"
        response.should have_selector("img", :src => "/volumes/#{@volume[:job_id]}/thumb.jpg" )
      end
    end

    # TODO NEED_TEST for new layout of collection carousel
    
    # TODO NEED_TEST this may be used for collection listing page 
#    describe "collections carosel" do
#      before(:each) do
#        truncate_table(ActiveRecord::Base.connection, "users", {})
#        User.gen() unless User.first
#        @user = User.first
#        log_in(@user)
#        @other_user = User.gen
#
#        truncate_table(ActiveRecord::Base.connection, "collections", {})
#        @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description", :updated_at => Time.now, :status => false)
#        @my_public_collection = Collection.create(:user_id => @user.id, :title => "my public collection",:description => "description", :updated_at => Time.now, :status => true)
#        @other_public_collection = Collection.create(:user_id => @other_user.id, :title => "other public collection",:description => "description", :updated_at => "2013-12-02 09:17:54 UTC", :status => true)
#  
#        truncate_table(ActiveRecord::Base.connection, "book_collections", {})
#        @book_in_my_private_collection = BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @volume.id, :position => 1)
#        @second_book_in_my_private_collection = BookCollection.create(:collection_id => @my_public_collection.id, :volume_id => @volume.id, :position => 2)
#        @third_book_in_my_private_collection = BookCollection.create(:collection_id => @other_public_collection.id, :volume_id => @volume.id, :position => 3)
#      end
      
#      it "should have an open link for public collections of other user" do
#        get :show, :id => @volume[:job_id]
#        response.should have_selector('a', :href => "/collections/show/#{@other_public_collection.id}", :content =>@other_public_collection.title)
#        response.should have_selector('a', :href => "/collections/show/#{@my_private_collection.id}", :content =>@my_private_collection.title)
#        response.should have_selector('a', :href => "/collections/show/#{@my_public_collection.id}", :content =>@my_public_collection.title)
#      end      
      
#      it "should have last modified date for public collections of ther user" do
#        get :show, { :id => @volume.job_id, :tab => "collections" }
#        response.should have_selector('h5', :content =>"2013-12-02 09:17:54 UTC")
#      end
#
#      it "should have pagination bar" do
#        truncate_table(ActiveRecord::Base.connection, "book_collections", {})
#        20.times {BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @volume.id, :position => 1)}
#        get :show, :id => @volume.job_id
#        response.should have_selector('ul', :class => "pagination")
#        truncate_table(ActiveRecord::Base.connection, "book_collections", {})
#      end

#    end

    # TODO NEED_TEST add some related books then uncomment these specs
    describe "related books" do
      it "should show related books title" 
#        get :show, :id => @volume.job_id
#        response.should have_selector('h4', :content => I18n.t(:book_details_related))
#      end

      it "should display title for each related book" 
#        get :show, :id => @volume.job_id
#        response.should have_selector('a', :href =>"/books/#{@volume_with_parameters.job_id}", :content => "Test Book 2")
#      end
    end

  end

  describe "tabs links" do
    
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})
        
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book"
      doc[:single_bok_title]  = "title"

      @book = Book.gen(:title => "Test Book", :bibid => "456", :mods => "<xml>xml content</xml>")
      @volume = Volume.gen(:book => @book, :job_id => 123)

      doc2 = {:vol_jobid => "1234", :bok_bibid => "4567"}
      doc2[:bok_title] = "Test Book 2"
      doc2[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      doc2[:bok_language] = "English"
      doc2[:bok_start_date] = '1838-01-01T00:00:00Z'
      doc2[:bok_publisher] = "The Society"
      doc2[:subject] = ["one", "two", "three", "four", "five"]
      doc2[:geo_location] = ["location"]
      doc2[:author] = ["author1", "author2"]
      doc2[:single_bok_title]  = "title"

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

      doc3 = {:vol_jobid => "12345", :bok_bibid => "45678"}
      doc3[:bok_title] = "Test Book 3"
      doc3[:name] = ["Test Name 2","second","third","fourth","fifth","sixth","seventh"]
      doc3[:single_bok_title]  = "title"
        
      @book_with_one_name= Book.gen(:title => "Test Book 3", :bibid => "45678", :mods => "<xml>xml content</xml>")
      @volume_with_one_name = Volume.gen(:book => @book_with_parameters, :job_id => 12345)
      
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc
      solr.commit
      solr.add doc2
      solr.commit
      solr.add doc3
      solr.commit
    end
    
    it "should link to mods" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "#modal-container", :content => I18n.t(:book_details_mods))
    end

    it "should link to bibtex" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "#modal-container", :content => I18n.t(:book_details_bibtex))
    end

    it "should link to endnote" do
      get 'show', :id => "123"
      response.should have_selector("a", :href => "#modal-container", :content => I18n.t(:book_details_endnote))
    end
  
    describe "book details" do

      it "should display author only if it exists in the meta data" do
        get 'show', :id => "123"
        response.should_not have_selector("dt", :content => I18n.t(:book_author_title))
        get 'show', :id => "1234"
        response.should have_selector("dt", :content => I18n.t(:book_author_title))
      end

      it "should display Genre only if it exists in the meta data" do
        get 'show', :id => "123"
        response.should_not have_selector("dt", :content => I18n.t(:book_subject_title))
        get 'show', :id => "1234"
        response.should have_selector("dt", :content => I18n.t(:book_subject_title))
      end

      it "should display book name only if it exists in the meta data" do
        get 'show', :id => "123"
        response.should_not have_selector("dt", :content => I18n.t(:book_name_title))
        get 'show', :id => "1234"
        response.should have_selector("dt", :content => I18n.t(:book_name_title))
      end

      it "should not contains 'and more' when names are less than 5" do
        get 'show', :id => "12345"
        response.should_not have_selector("span", :content => "more")
      end

      it "should contains 'and more' with the correct number when names are greater than 5" do
        get 'show', :id => "1234"
        response.should have_selector("span", :content => " and 2 more...")
      end
    end
  end

  # TODO NEED_TEST for comments' new layout 
  describe "list comments for a book" do
    
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "comments", {})
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "users", {})
      @book = Book.create(:title => 'Test Book First', :bibid => '456')
      @vol = Volume.create(:book => @book, :job_id => '123', :get_thumbnail_fail => 0)
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book"
      doc[:single_bok_title] = "title"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.add doc
      solr.commit
      User.gen() unless User.first
      @user = User.first      
      @other_user = User.gen
      
      @appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "reply on first book comment")
      @reply_of_appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => nil, :comment_id => @appropriate_book_comment.id, :text => "first book comment")
      @inappropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "second book comment", :number_of_marks => 2)
      @appropriate_book_comment_without_replies = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "book comment")
    end
    
#    it "should list all comments and replies of a book" do
#      get :show, :id => @vol.job_id
#      response.should have_selector("div", :id => "comment#{@appropriate_book_comment.id}")
#      response.should have_selector("p", :content => @appropriate_book_comment.text)
#      response.should have_selector("div", :id => "comment#{@reply_of_appropriate_book_comment.id}")
#      response.should have_selector("p", :content => @reply_of_appropriate_book_comment.text)
#      response.should have_selector("div", :id => "comment#{@appropriate_book_comment_without_replies.id}")
#      response.should have_selector("p", :content => @appropriate_book_comment_without_replies.text)
#    end
    
    it "should show message for inappropriate comments with show link" 
#      get :show, :id => @vol.job_id
#      response.should have_selector("span", :id => "abuse#{@inappropriate_book_comment.id}")
#      response.should have_selector("p", :content => I18n.t(:hidden_comment_msg))
#      response.should have_selector("a", :content => "show")
#    end
    
    it "should have a button for each comment or a reply to it as inappropriate " 
#      get :show, :id => @vol.job_id
#      response.should have_selector("input", :type => "button", :id => "mark#{@appropriate_book_comment.id}")
#      response.should have_selector("input", :type => "button", :id => "mark#{@reply_of_appropriate_book_comment.id}")
#      response.should have_selector("input", :type => "button", :id => "mark#{@appropriate_book_comment_without_replies.id}")
#    end
    
    it "should display comment delete link only for owner of the comment or reply" 
#      log_in(@user)
#      get :show, :id => @vol.job_id
#      response.should have_selector("a", :href => "/comments/delete?id=#{@reply_of_appropriate_book_comment.id}")
#      response.should have_selector("a", :href => "/comments/delete?id=#{@appropriate_book_comment_without_replies.id}")
#    end
    
    it "should not display comment delete link only for owner of the comment or reply" 
#      log_in(@other_user)
#      get :show, :id => @vol.job_id
#      response.should_not have_selector("a", :href => "/comments/delete?id=#{@reply_of_appropriate_book_comment.id}")
#      response.should_not have_selector("a", :href => "/comments/delete?id=#{@appropriate_book_comment_without_replies.id}")
#    end
    
    it "should not display comment delete link for comments having replies" 
#      log_in(@user)
#      get :show, :id => @vol.job_id
#      response.should_not have_selector("a", :href => "/comments/delete?id=#{@appropriate_book_comment.id}")
#    end
    
    it "should display form for craeting new comment when user is signed in" do
      log_in(@user)
      get :show, :id => @vol.job_id
      response.should have_selector("form", :id => "new_comment")
    end
    
    it "should not display form for craeting new comment when user is not signed in" do
      get :show, :id => @vol.job_id
      response.should_not have_selector("form", :id => "new_comment")
    end
    
    it "should have pagination bar" 
#      truncate_table(ActiveRecord::Base.connection, "comments", {})
#      20.times { |i| Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "comment")}
#      get :show, :id => @vol.job_id
#      response.should have_selector('ul', :class => "pagination")
#      truncate_table(ActiveRecord::Base.connection, "comments", {})
#    end

  end

end
