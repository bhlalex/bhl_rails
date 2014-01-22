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
  
  describe "reviews" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      @user1 = User.gen() 
      @user2 = User.gen() 
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "comments", {})
      @col = Collection.gen(:user => @user1, :title => "title", :description => "description", :is_public => true)  
    end
    
    describe "replies" do
      it "should allow logged in user to reply and should increment the number of replies", :js => true do
       #log in user 1
       visit("/users/login")
       fill_in "username", :with => "#{@user1.username}"
       fill_in "password", :with => "test password"
       find("#submit").click
       visit("/collections/#{@col.id}")
       #create comment
       find("#modal-4").click
       fill_in "commnettext", :with => "comment text"
       find("#post").click
       #create reply
       click_on("#{I18n.t(:reply)}")
       fill_in "commnettext1", :with => "reply text"
       find("#post1").click
       page.should have_content("#{I18n.t(:replies)} (1)")
     end
     
      it "should not display abused replies", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        #create comment
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        #create reply
        click_on("#{I18n.t(:reply)}")
        fill_in "commnettext1", :with => "reply text"
        find("#post1").click
        find("#repliescount1").click
        find("#markabuse2").click
        page.should have_content("#{I18n.t(:hidden_comment_msg)}")
      end
    end
    
    describe "comments" do
      it "should have the photo of the owner of the comment", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        page.should have_content("comment text")
        page.should have_selector("img", :src => "/images_en/user.png")
      end
      
      it "should have link to the owner of the comment", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        find("#post").click
        page.should have_selector("a", :content => "#{@user1.real_name}")
      end
      
      it "should have the comment text", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        page.should have_content("comment text")
      end
      
      it "should not create comment with empty text", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        find("#post").click
        Comment.all.count.should == 0
      end
      
      it "should display other users comments" , :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        #log out
        visit("/users/logout")
        #log in user 2
        visit("/users/login")
        fill_in "username", :with => "#{@user2.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        page.should have_content("comment text")
      end
      
      it "should not allow not signed in user to comment", :js => true do
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        page.should have_content("#{I18n.t(:please_login)}")
      end
      
      it "should report link and not display abused comments", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        page.should have_content("comment text")
        find("#markabuse1").click
        page.should have_content("#{I18n.t(:hidden_comment_msg)}")
      end
      
      it "should have delete link for the owner", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        page.should have_content("comment text")
        page.should have_selector("a", :href => "/comments/delete?id=1")
      end
      
      it "should not have a delete link for any user except the owner", :js => true do
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        find("#modal-4").click
        fill_in "commnettext", :with => "comment text"
        find("#post").click
        page.should have_content("comment text")
        visit("/users/logout")
        visit("/collections/#{@col.id}")
        page.should_not have_selector("a", :href => "/comments/delete?id=1")
        #log in user 1
        visit("/users/login")
        fill_in "username", :with => "#{@user2.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/collections/#{@col.id}")
        page.should_not have_selector("a", :href => "/comments/delete?id=1")
      end
    
      describe "comments pagination" do
        it "should have pagination", :js => true do
          #log in user 1
          visit("/users/login")
          fill_in "username", :with => "#{@user1.username}"
          fill_in "password", :with => "test password"
          find("#submit").click
          visit("/collections/#{@col.id}")
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 1"
          find("#post").click
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 2"
          find("#post").click
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 3"
          find("#post").click
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 4"
          find("#post").click
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 5"
          find("#post").click
          find("#modal-4").click
          fill_in "commnettext", :with => "comment text 6"
          find("#post").click
          page.should_not have_content("comment text 6")
          find("#newer").click
          page.should have_content("comment text 6")
          page.should_not have_content("comment text 1")
          find("#older").click
          page.should have_content("comment text 1")
          page.should_not have_content("comment text 6")
        end
      end
    end
  end
 
end


