require 'spec_helper'
include BHL::Login
describe "books" do  
  
  describe "book rating" do
    before(:each) do
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
      name1 = Name.gen(string: "sci1")
      name2 = Name.gen(string: "sci2")
      name3 = Name.gen(string: "sci3")
      page_first = Page.gen(:volume => @vol_first )

      PageName.create(:page => page_first, :name => name1, :namestring => "sci1")
      PageName.create(:page => page_first, :name => name2, :namestring => "sci2")
      PageName.create(:page => page_first, :name => name3, :namestring => "sci3")

      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc_test_first
      solr.commit
      
      @user1 = User.gen(active: true) 
      @user2 = User.gen(active: true) 
      
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
      #delay
      sleep(10)
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.to_f.should == 3.0
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
      Volume.find_by_job_id(@vol_first.job_id).rate.to_f.should == 3.0
      #edit rate to 1
      find("#star1").click
      #delay
      sleep(10)
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
      #delay
      sleep(10)
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.to_f.should == 3.0
      
      visit("/users/logout")
      
      #log in user 2
      visit("/users/login")
      fill_in "username", :with => "#{@user2.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/books/#{@vol_first.job_id}")
      #rate with 5
      find("#star5").click
      #delay
      sleep(10)
      #check average rate
      Volume.find_by_job_id(@vol_first.job_id).rate.to_f.should == 4.0
    end
    
    it "should not allow not logged in user to rate", :js => true do
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
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_found_collections)}")
        page.should have_selector("a", :href => "/en/collections/#{@first_public_collection.id}", :content => "#{@first_public_collection.title}")
        page.should have_selector("a", :href => "/en/collections/#{@second_public_collection.id}", :content => "#{@second_public_collection.title}")

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
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_related)}")
        page.should have_selector("a", :href => "/en/books/#{@vol_second.job_id}", :content => "#{@book_test_second.title}")
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
        page.should have_selector("h4", :content => "#{I18n.t(:book_details_user_viewed)}")
        page.should have_selector("a", :href => "/en/books/#{@vol_second.job_id}", :content => "#{@book_test_second.title}")
      end
    end
  end
    
  describe "reviews" do
    before(:each) do
      @user1 = User.gen(active: true) 
      @user2 = User.gen() 
      @col = Collection.gen(:user => @user1, :title => "title", :description => "description", :is_public => true)  
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      # remove this book if exists
      solr.delete_by_query('*:*')
      solr.commit
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
        page.should have_selector("img", :src => "/images_#{I18n.locale}/#{I18n.t(:default_user)}")
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


