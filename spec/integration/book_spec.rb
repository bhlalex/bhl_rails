require 'spec_helper'
include BHL::Login
describe "books" do
  
  it 'should contain tagged species' do
    visit("/books")
    body.should include "TAGGED SPECIES"
  end
  
  it 'should contain languages' do
    visit("/books")
    body.should include "LANGUAGES"
  end
  
  it 'should contain authors' do
    visit("/books")
    body.should include "AUTHORS"
  end
  
  it 'should contain affiliation' do
    visit("/books")
    body.should include "AFFILIATION"
  end
  
  # this was put here because when put in controller the url not found and tells "LoadError: cannot load such file -- action_controller/integration> " 
  it "should display book image" do
    visit("/books")
    lambda do
    visit("http://localhost:3000/volumes/123/thumb.jpg")
      end.should_not raise_error
  end
  
  describe "book rating" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "volume_ratings", {})
      doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
      doc_test_first[:bok_title] = "Test Book First"
      doc_test_first[:name] = ["sci1","sci2", "sci3"]
      doc_test_first[:author] = "Author"
      doc_test_first[:bok_language]="English"
      doc_test_first[:geo_location]="Egypt"
      doc_test_first[:subject]="subject"
      doc_test_first[:single_bok_title] = "title"

      @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc_test_first
      solr.commit
      
      truncate_table(ActiveRecord::Base.connection, "users", {})
      @user1 = User.gen() 
      @user2 = User.gen() 
      
    end
    
    it "should allow logged in user to rate book", :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #rate with 3
      visit("/books/#{@vol_first.job_id}")
      find("#star3").click
      visit("/books/#{@vol_first.job_id}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 3.0
    end
    
    it "should allow the logged in user to edit his rate", :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #rate with 3
      visit("/books/#{@vol_first.job_id}")
      find("#star3").click
      visit("/books/#{@vol_first.job_id}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 3.0
      #edit rate to 1
      find("#star1").click
      visit("/books/#{@vol_first.job_id}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 1.0
      
    end
     
    it "should have correct total average rate", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/books/#{@vol_first.job_id}")
      #rate with 3
      find("#star3").click
      visit("/books/#{@vol_first.job_id}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 3.0
      
      visit("/users/logout")
      
      #log in user 2
      visit("/users/login")
      fill_in "username", :with => "#{@user2.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/books/#{@vol_first.job_id}")
      #rate with 5
      find("#star5").click
      visit("/books/#{@vol_first.job_id}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 4.0
    end
    
    it "should not allow not logged in user to rate", :js => true do
      #log out
      visit("/users/logout")
      visit("/books/#{@vol_first.job_id}")
      #rate with 3
      find("#star3").click
      page.should have_content("#{I18n.t(:sign_in)}")
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.should == 0.0
    end
  end
  
  describe "book detail carousels" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "volume_collections", {})
      truncate_table(ActiveRecord::Base.connection, "book_views", {})
      truncate_table(ActiveRecord::Base.connection, "volume_ratings", {})

      
      @name1 = Name.gen(:string => "sci1")
      @name2 = Name.gen(:string => "sci2")
      @name3 = Name.gen(:string => "sci3")

      doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
      doc_test_first[:bok_title] = "Test Book First"
      doc_test_first[:name] = ["sci1","sci2"]
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
      doc_test_second[:name] = ["sci2","sci3"]
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

      PageName.create(:page => @page_second, :name => @name2, :namestring => "sci2")
      PageName.create(:page => @page_second, :name => @name3, :namestring => "sci3")
      PageName.create(:page => @page_first, :name => @name1, :namestring => "sci1")
      PageName.create(:page => @page_first, :name => @name2, :namestring => "sci2")

      truncate_table(ActiveRecord::Base.connection, "users", {})
       @user = User.gen() 
       
     # collections
      @private_collection = Collection.create(:user_id => @user_id, :title => "private collection", :description => "description", :is_public => false)
      @first_public_collection = Collection.create(:user_id => @user_id, :title => "first public collection", :description => "description", :is_public => true)
      @second_public_collection = Collection.create(:user_id => @user_id, :title => "second public collection", :description => "description", :is_public => true)
      @book_in_private_collection = VolumeCollection.create(:collection_id => @private_collection.id, :volume_id => @vol_first.id, :position => 1)
      @book_in_first_public_collection = VolumeCollection.create(:collection_id => @first_public_collection.id, :volume_id => @vol_first.id, :position => 1)
      @book_in_second_public_collection = VolumeCollection.create(:collection_id => @second_public_collection.id, :volume_id => @vol_first.id, :position => 1)

      # book views
      book_views = BookView.create(:book_id1 => @vol_first.job_id, :book_id2 => @vol_second.job_id)
    end
    describe "book collections" do


      it "should display open link for each public book collection" , :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/books/#{@vol_first.job_id}")
        # delay
        sleep 50
        find("#star3").click
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_found_collections)}")
        page.should have_selector("a", :href => "/collections/#{@first_public_collection.id}", :content => "#{@first_public_collection.title}")
        page.should have_selector("a", :href => "/collections/#{@second_public_collection.id}", :content => "#{@second_public_collection.title}")

      end
    end
    
    describe "related books" do
      
      it "should display open link for each related book" , :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/books/#{@vol_first.job_id}")
        # delay
        sleep 50
        find("#star3").click
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_related)}")
        page.should have_selector("a", :href => "/books/#{@vol_second.job_id}", :content => "#{@book_test_second.title}")
      end
      
    end
    
    describe "user also viewed" do
      it "should display open link for each also viewed book" , :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/books/#{@vol_first.job_id}")
        # delay
        sleep 50
        find("#star3").click
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_user_viewed)}")
        page.should have_selector("a", :href => "/books/#{@vol_second.job_id}", :content => "#{@book_test_second.title}")
      end
    end
    
  end
end


