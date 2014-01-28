require 'spec_helper'
include BHL::Login
describe "collections" do
  describe "collection rating" do
    
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "collection_ratings", {})
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
      @private_col = Collection.gen(:user => @user1, :title => "privatecol", :description => "description", :is_public => false)
      
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
      #choose collection
      find("#idselect_1").click
      find("##{@col.id}").click
      click_on("Save")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for not adding book to the created collection
      VolumeCollection.all.count.should == 1
    end
    
    it "should allow user to choose one of his private collections", :js => true do
      #log in user 1
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      #choose collection
      find("#idselect_1").click
      find("##{@private_col.id}").click
      click_on("Save")
      #make a delay to allow the database to finish inserting records
      visit("/books")
      #check for not adding book to the created collection
      VolumeCollection.all.count.should == 1
    end
       
    it "should not allow user to choose other's collections", :js => true do
      #log in user 2
      visit("/users/login")
      fill_in "username", :with => "#{@user2.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #open dialog
      visit("/books")
      find("#opener_1").click
      page.should_not have_content("#{I18n.t(:choose_collection)}")
      #create collection
      find("#new_1").click
      fill_in "collectiontitle_1", :with => "12345"
      click_on("Save")
      #reopen dialog
      find("#opener_1").click
      find("#idselect_1").click
      page.should_not have_content("#{@private_col.title}")
      page.should_not have_content("#{@col.title}")
      page.should have_content("12345")
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
 
  describe "collection photo" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "volume_collections", {})
      @user1 = User.gen() 
      @user2 = User.gen() 
      @col = Collection.gen(:user => @user1, :title => "title", :description => "description", :is_public => true)
    end
    
    describe "display collection avatar" do
      it "should display avatar for collection without delete photo option", :js => true do
        #show collection detail
        visit("/collections/#{@col.id}")
        # check displaying user avatar
        expect(page).to have_selector("img", :src => "/images_#{I18n.locale}/#{I18n.t(:default_collection)}")
        expect(page).not_to have_selector("input", :id => "delete_photo")
      end
    end
    
    describe "display collection uploaded photo" do
      before(:each) do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        # upload photo for collection
        visit("/collections/#{@col.id}/edit")
        attach_file('photo_name', "#{Rails.root}/public/images_#{I18n.locale}/#{I18n.t(:logo)}")
        find("#submit").click
        visit("/users/logout")
      end
      it "should display uploaded collection photo with delete photo option for owner user only", :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        #show collection detail
        visit("/collections/#{@col.id}")
        # check displaying collection uploaded photo
        photo_name = "thumb_#{(Collection.find(@col)).photo_name}
        expect(page).to have_selector('img', :src => "#{photo_name}")
        expect(page).to have_selector("input", :id => "delete_photo")
        @col.photo_name = nil
        FileUtils.remove_dir("#{Rails.root}/public/collections/#{@col.id}") if File.directory? "#{Rails.root}/public/collections/#{@col.id}"
      end
      
      it "should delete uploaded collection photo", :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user1.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        visit("/get_collection_photo?id=#{@col.id}&is_delete=1")
        expect(page).to have_selector("img", :src => "/images_#{I18n.locale}/#{I18n.t(:default_collection)}")
        expect(page).not_to have_selector("input", :id => "delete_photo")
        FileUtils.remove_dir("#{Rails.root}/public/collections/#{@col.id}") if File.directory? "#{Rails.root}/public/collections/#{@col.id}"
        @col.photo_name = nil
      end
      
      it "should display uploaded collection photo without delete photo option for non owner user", :js => true do
        #log in
        visit("/users/login")
        fill_in "username", :with => "#{@user2.username}"
        fill_in "password", :with => "test password"
        find("#submit").click
        #show user profile
        visit("/collections/#{@col.id}")
        # check displaying user avatar
        photo_name = "thumb_#{(Collection.find(@col)).photo_name}
        expect(page).to have_selector('img', :src => "#{photo_name}")
        expect(page).not_to have_selector("input", :id => "delete_photo")
        @col.photo_name = nil
        FileUtils.remove_dir("#{Rails.root}/public/collections/#{@col.id}") if File.directory? "#{Rails.root}/public/collections/#{@col.id}"
      end
    end
  end
end