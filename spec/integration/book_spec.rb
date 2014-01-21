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
  
end


