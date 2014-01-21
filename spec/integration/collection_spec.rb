require 'spec_helper'
include BHL::Login
describe "collections" do
  describe "collection rating" do
    
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      @user1 = User.gen() 
      @user2 = User.gen() 
      @col = Collection.gen(:user => @user1, :title => "title", :description => "description")
    end
    
    it "should allow logged in user to rate collection", :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #rate with 3
      visit("/collections/#{@col.id}")
      find("#star3").click
      visit("/collections/#{@col.id}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 3.0
    end
    
    it "should allow the logged in user to edit his rate", :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #rate with 3
      visit("/collections/#{@col.id}")
      find("#star3").click
      visit("/collections/#{@col.id}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 3.0
      #edit rate to 1
      find("#star1").click
      visit("/collections/#{@col.id}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 1.0
      
    end
     
    it "should have correct total average rate", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/collections/#{@col.id}")
      #rate with 3
      find("#star3").click
      visit("/collections/#{@col.id}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 3.0
      
      visit("/users/logout")
      
      #log in user 2
      visit("/users/login")
      fill_in "username", :with => "#{@user2.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/collections/#{@col.id}")
      #rate with 5
      find("#star5").click
      visit("/collections/#{@col.id}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 4.0
    end
    
    it "should not allow not logged in user to rate", :js => true do
      #log out
      visit("/users/logout")
      visit("/collections/#{@col.id}")
      #rate with 3
      find("#star3").click
      page.should have_content("#{I18n.t(:sign_in)}")
      #check average rate
      Collection.find_by_id(@col.id).rate.should == 0.0
    end
  end
  
  describe "add book to collection" do

    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "volume_collections", {})
      @user1 = User.gen() 
      @user2 = User.gen() 
      @col = Collection.gen(:user => @user1, :title => "title", :description => "description", :is_public => true)
      @private_col = Collection.gen(:user => @user1, :title => "title", :description => "description", :is_public => false)
      
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

      @book = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol = Volume.gen(:book => @book, :job_id => '123', :get_thumbnail_fail => 0)

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc_test_first
      solr.commit
    end
    
    it "should not allow signed out user to add book to collection", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      page.should_not have_content("I18n.t(:sidelinks_add_collection)")
    end
    
    it "should allow logged in user to add book to new collection", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      #create collection
      find("#new_1").click
      fill_in "collectiontitle_1", :with => "hello"
      click_on("Save")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for creating collection
      collection =  Collection.where(:user_id => @user1.id , :title => "hello")
      collection.count.should == 1
      #check for adding book to the created collection
      VolumeCollection.all.count.should == 1
    end
    
    it "should require a title for new collection", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      #create collection
      find("#new_1").click
      click_on("Save")
      page.should have_content("#{I18n.t(:missing_title_error_msg)}")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for not creating collection
      collection =  Collection.where(:user_id => @user1.id , :title => "")
      collection.count.should == 0
      #check for not adding book to the created collection
      VolumeCollection.all.count.should == 0
    end
    
    it "should have title larger than 4 char", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      #create collection
      find("#new_1").click
      fill_in "collectiontitle_1", :with => "12"
      click_on("Save")
      page.should have_content("#{I18n.t(:missing_title_error_msg)}")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for not creating collection
      collection =  Collection.where(:user_id => @user1.id , :title => "")
      collection.count.should == 0
      #check for not adding book to the created collection
      VolumeCollection.all.count.should == 0
    end
    
    it "should allow logged in user to add book to pre-exixsting collection", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      #create collection
      find("#idselect_1").click
      find("##{@col.id}").click
      click_on("Save")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for not adding book to the created collection
      VolumeCollection.all.count.should == 1
    end
    
    it "should allow user to choose one of his private collections", :js => true do
      
    end
    it "should not allow user to choose other's private collections"
    
    
  end
end