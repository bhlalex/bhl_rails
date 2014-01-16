require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login
include UsersHelper

describe UsersController do
  render_views

  before(:each) do
    truncate_table(ActiveRecord::Base.connection, "users", {})
    User.gen() unless User.first
    @user = User.first
    log_out # to make sure the session is cleared
  end

  describe 'GET new' do

    it "returns http success" do
      get :new
      response.should be_success
    end

    it 'should render new unless logged in' do
      get :new
      response.should render_template('users/new')
      response.should be_success
      log_in(@user)
      get :new
      response.should_not render_template('users/new')
      expect(response).to redirect_to("/users/#{@user.id}")
    end
  end

  describe 'GET show' do
    before(:each) do
      log_in(@user)
    end

    it 'should render show' do
      get :show, { :id => @user.id }
      response.should render_template('users/show')
    end

    describe "tabs" do
      before(:each) do
        log_in(@user)
      end
      it "should link to profile" do
        get :show, :id => @user.id
        response.should have_selector("a", :href => "/users/#{@user[:id]}/profile", :content => I18n.t(:user_profile_tab))
      end

      it "should link to recently_viewed when user is logged in" do
        get :show, :id => @user.id
        response.should have_selector("a", :href => "/users/#{@user[:id]}/history", :content => I18n.t(:user_history_tab))
      end

      describe "'right panel'" do
        before(:each) do
          truncate_table(ActiveRecord::Base.connection, "books", {})
          truncate_table(ActiveRecord::Base.connection, "volumes", {})
          truncate_table(ActiveRecord::Base.connection, "user_book_histories", {})
          doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
          doc_test_first[:bok_title] = "Test Book First"
          doc_test_first[:name] = ["Name1","Name2"]
          doc_test_first[:author] = "Author"
          doc_test_first[:bok_language]="English"
          doc_test_first[:geo_location]="Egypt"
          doc_test_first[:subject]="subject"
          doc_test_first[:single_bok_title] = "title"

          solr = RSolr.connect :url => SOLR_BOOKS_METADATA
          solr.delete_by_query('*:*')
          solr.commit
          solr.add doc_test_first
          solr.commit
          @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
          @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)
          UserBookHistory.create(:volume_id => @vol_first.id, :user_id => @user.id, :updated_at => Time.now)
        end
#        it "should have book title links to details page" do
#          get :show, :id => @user.id
#          response.should have_selector("a", :href => "/books/#{@vol_first.job_id}/brief")
#        end
       
        it "should have recently viewed link" do
          get :show, :id => @user.id
          response.should have_selector("a", :href => "/users/#{@user.id}/history")
        end
      end
      describe "'recently_viewed tab'" do

        before(:each) do
          truncate_table(ActiveRecord::Base.connection, "books", {})
          truncate_table(ActiveRecord::Base.connection, "volumes", {})
          truncate_table(ActiveRecord::Base.connection, "user_book_histories", {})
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
          doc_test_second[:bok_language] = "English"
          doc_test_second[:geo_location] = "Egypt"
          doc_test_second[:subject] = "subject"
          doc_test_second[:single_bok_title] = "title"

          solr = RSolr.connect :url => SOLR_BOOKS_METADATA
          # remove this book if exists
          solr.delete_by_query('vol_jobid:238233')
          solr.commit
          solr.add doc_test_second
          solr.commit

          @book_test_second = Book.gen(:title => 'Test Book Second', :bibid => '456')
          @vol_second = Volume.gen(:book_id => @book_test_second.id, :job_id => '238233', :get_thumbnail_fail => 0)
          @page_second = Page.gen(:volume => @vol_second )
                    
          PageName.create(:page => @page_second, :name => @name2, :namestring => "Name2")
          PageName.create(:page => @page_second, :name => @name3, :namestring => "Name3")
          PageName.create(:page => @page_first, :name => @name1, :namestring => "Name1")
          PageName.create(:page => @page_first, :name => @name2, :namestring => "Name2")
                    
          UserBookHistory.create(:volume_id => @vol_first.id, :user_id => @user.id, :updated_at => Time.now)
          UserBookHistory.create(:volume_id => @vol_second.id, :user_id => @user.id, :updated_at => Time.now)
        end

        it "should display last visited date" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector("small", :content => "#{(UserBookHistory.first).updated_at}")
        end
               
        it "should not exists if user is not logged in" do
          log_out
          get :show, :id => @user.id, :tab => "history"
          response.should redirect_to :controller => :users, :action => :login
        end
        # check for books count
        it "should have item count equal to the total number of books" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector("span", :class => "badge", :content => 2.to_s)
        end

        # check for existance of image for each book in list view
        it "should have an image for each book" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
          response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
        end
        
        # check for existance of detail link for each book_title in list view
        it "should have book title that links for details" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector('a', :href => "/books/123" ,:content => "Test Book First")
          response.should have_selector('a', :href => "/books/238233", :content => "Test Book Second")
        end
        
        # check for existance of read and detail links for each book in list view
        it "should have details link for each book" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector('a', :href => "/books/123", :content => I18n.t(:sidelinks_detail))
          response.should have_selector('a', :href => "/books/238233", :content => I18n.t(:sidelinks_detail))
        end
        
        it "should have read link for each book" do
          get :show, :id => @user.id, :tab => "history"
          response.should have_selector('a', :href => "/books/123/read", :content => I18n.t(:sidelinks_read))
          response.should have_selector('a', :href => "/books/238233/read", :content => I18n.t(:sidelinks_read))
        end
        
      end
    end

    # saved queries test
    describe "saved queries" do
      before(:each) do
        truncate_table(ActiveRecord::Base.connection, "queries", {})
        @query_first = Query.create(:user_id => @user.id, :string => "_title=popular", :created_at => "2013-11-19 22:00:00 UTC")
        @query_second = Query.create(:user_id => @user.id, :string => "_content=smith", :created_at => "2013-11-18 22:00:00 UTC")
      end

      it "should display total number of saved queries" do
          get :show, { :id => @user.id, :tab => "queries" }
          response.should have_selector("span",:class => "badge", :content => 2.to_s)
      end
        
      it "should contains query content body" do
        get :show, { :id => @user.id, :tab => "queries" }
        response.should have_selector("b", :content => "Title")
      end

      it "should contains show result link for query" do
        get :show, { :id => @user.id, :tab => "queries" }
        response.should have_selector('a', :href => "/books?_title=popular", :content => "#{I18n.t(:user_queries_books_found)} #{get_number_of_returned_books(@query_first.string)}")
        response.should have_selector('a', :href => "/books?_content=smith", :content => "#{I18n.t(:user_queries_books_found)} #{get_number_of_returned_books(@query_second.string)}")
      end

      it "should contains delete link for each query" do
        get :show, { :id => @user.id, :tab => "queries" }
        response.should have_selector('a', :href => "/user_search_history/delete_query/#{@query_first.id}")
        response.should have_selector('a', :href => "/user_search_history/delete_query/#{@query_second.id}")
      end

      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "queries", {})
        20.times {Query.create(:user_id => @user.id, :string => "_title=popular")}
        get :show, { :id => @user.id, :tab => "queries" }
        response.should have_selector('ul', :class => "pagination")
        truncate_table(ActiveRecord::Base.connection, "queries", {})
      end

    end
    # end


    describe "list collections" do
      before(:each) do
        @other_user = User.gen

        truncate_table(ActiveRecord::Base.connection, "collections", {})
        @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description", :updated_at => "2013-11-20 ", :is_public => false)
        @my_public_collection = Collection.create(:user_id => @user.id, :title => "my public collection",:description => "description", :updated_at => "2013-11-19 ", :is_public => true)
        @other_private_collection = Collection.create(:user_id => @other_user.id, :title => "other private collection",:description => "description", :updated_at => "2013-11-18 ", :is_public => false)
        @other_public_collection = Collection.create(:user_id => @other_user.id, :title => "other public collection",:description => "description", :updated_at => "2013-11-17 ", :is_public => true)

      end
      it "should list current user's collections " do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('span', :class => "badge", :content =>2.to_s)
      end

      it "should list public collections of other user" do
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('span', :class => "badge", :content =>1.to_s)
      end

      it "should have an open link for public collections of other user" do
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/#{@other_public_collection.id}", :content => "#{@other_public_collection.title}")
      end


      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "collections", {})
        20.times {Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description", :updated_at => "2013-11-20 ", :is_public => true)}
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('ul', :class => "pagination")
        truncate_table(ActiveRecord::Base.connection, "collections", {})
      end

      it "should have an open link for each collection of my collections" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/#{@my_private_collection.id}", :content => "#{@my_private_collection.title}")
        response.should have_selector('a', :href => "/collections/#{@my_public_collection.id}", :content => "#{@my_public_collection.title}")
      end

      it "should have an image for each collection" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a>img', :src => "/images_en/nocollection140.png")
      end

      it "should have delete link for the collections owned by the current user" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/destroy_collection/#{@my_private_collection.id}?page=1&user_id=#{@user.id}")
        response.should have_selector('a', :href => "/collections/destroy_collection/#{@my_public_collection.id}?page=1&user_id=#{@user.id}")
      end
      
    it "should have added on date in my collections" do
      get :show, { :id => @user.id, :tab => "collections" }
      response.should have_selector('small', :content => "#{@my_private_collection.created_at}")
      response.should have_selector('small', :content => "#{@my_public_collection.created_at}")
    end
    
    it "should have added on date in other user collections" do
      get :show, { :id => @other_user.id, :tab => "collections" }
      response.should have_selector('small', :content => "#{@other_public_collection.created_at}")
    end
      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "collections", {})
        20.times {Collection.create(:user_id => @user.id, :title => "my collection",:description => "description", :updated_at => "2013-11-20 ", :is_public => false)}
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('ul', :class => "pagination")
        truncate_table(ActiveRecord::Base.connection, "collections", {})
      end
    it "should detail link for each collection in my collectionsr" do
       get :show, { :id => @user.id, :tab => "collections" }
      response.should have_selector('a', :href => "/collections/#{@my_private_collection.id}", :content => "#{I18n.t(:sidelinks_detail)}")
      response.should have_selector('a', :href => "/collections/#{@my_public_collection.id}", :content => "#{I18n.t(:sidelinks_detail)}")
     end
    it "should detail link for each collection in other user collectionsr" do
       get :show, { :id => @other_user.id, :tab => "collections" }
      response.should have_selector('a', :href => "/collections/#{@other_public_collection.id}", :content => "#{I18n.t(:sidelinks_detail)}")
     end
    end
  end

  describe 'GET forgot_password' do
    it 'should not render forget_password if logged in' do
      log_in(@user)
      get :forgot_password
      response.should_not render_template('users/forgot_password')
      expect(response).to redirect_to("/users/#{@user.id}")
      log_out
      get :forgot_password
      response.should render_template('users/forgot_password')
    end
  end

  describe 'POST recover_password' do
    it 'should not render forget_password if logged in' do
      log_in(@user)
      post :recover_password
      response.should_not render_template('users/forgot_password')
      expect(response).to redirect_to("/users/#{@user.id}")
    end

    it "should find user by email or flash error if it can't find user by email" do
      post :recover_password, { :user => { :email => '' } }
      flash[:error].should_not be_blank
      expect(response).to redirect_to("/users/forgot_password")
      flash.clear

      post :recover_password, { :user => { :email => 'blabla' } }
      expect(response).to redirect_to("/users/forgot_password")
      flash[:error].should_not be_blank
      flash.clear

      post :recover_password, { :user => { :email => @user.email } }
      expect(response).to redirect_to("/users/login")
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
    end

    it 'should change verification activation code if valid email' do
      old_verification_code = @user.verification_code
      post :recover_password, { :user => { :email => @user.email } }
      expect(response).to redirect_to("/users/login")
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
      @user.reload # I had to reload the object to reflect the verfication_code changes
      @user.verification_code.should_not == old_verification_code
    end

  end

  describe 'POST create' do
    it 'should create a new user if registration is valid' do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      # I need to make sure no users exist to make sure that the user is not duplicate
      post :create, { :user => {
        :username => 'test_user',
        :entered_password => 'test_password',
        :entered_password_confirmation => 'test_password',
        :email => 'test@email.com',
        :email_confirmation => 'test@email.com',
        :real_name => "Test User"
        } }
      response.should_not render_template('users/new') # request is invalid and redirected to form
      @user = User.first
      @user.should_not be_nil
      @user.username.should == 'test_user'
      @user.password.should == Digest::MD5.hexdigest('test_password')
      @user.email.should == 'test@email.com'
      @user.real_name.should == "Test User"
      @user.active.should be_false
      expect(response).to redirect_to("/users/#{@user.id}")
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
    end
    it 'should create a new user if registration is valid' do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      User.gen(:username => 'test_user')
      post :create, { :user => {
        :username => 'test_user',
        :entered_password => 'test_password',
        :entered_password_confirmation => 'test_password',
        :email => 'test@email.com',
        :email_confirmation => 'test@email.com',
        :real_name => "Test User"
        } }
      response.should render_template('users/new') # request is invalid and redirected to form
    end
  end

  describe 'GET activate' do
    it 'new users should be inavtive by default' do
      user = User.gen
      user.active.should be_false
    end

    it 'should raise flash error and redirect to home page if user is already activated or invalid parameters' do
      user = User.gen

      get :activate, { :guid => "empty", :activation_code => "empty" }
      response.should redirect_to(root_path)
      flash[:error].should_not be_blank

      get :activate, { :guid => "empty", :activation_code => user.verification_code }
      response.should redirect_to("/")
      flash[:error].should_not be_blank

      get :activate, { :guid => user.guid, :activation_code => "empty"}
      response.should redirect_to("/")
      flash[:error].should_not be_blank

      user.activate
      get :activate, { :guid => user.guid, :activation_code => user.verification_code }
      response.should redirect_to("/")
      flash[:error].should_not be_blank
    end

    it 'should activate user and redirect to home page' do
      user = User.gen
      get :activate, { :guid => user.guid, :activation_code => user.verification_code }
      response.should redirect_to("/")
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
      user.reload
      user.active.should be_true
      user.verification_code.should be_blank
    end

    it 'should update active in session variables after activation' do
      user = User.gen
      log_in(user)
      get :activate, { :guid => user.guid, :activation_code => user.verification_code }
      session[:active].should be_true
    end
  end

  describe 'GET logout' do
    it 'should reset session and redirect to home page even if user is not logged in' do
      get :logout
      response.should redirect_to("/")
      user = User.gen
      log_in(user)
      session[:user_id].should_not be_nil
      get :logout
      response.should redirect_to("/")
      is_loggged_in?.should be_false
    end
  end

  describe 'GET login' do
    it 'should redirect to profile page if user is logged in' do
      user = User.gen
      log_in(user)
      get :login
      response.should redirect_to "/users/#{user.id}"
    end

    it 'should render login form' do
      get :login
      response.should render_template("users/login")
    end
  end

  describe 'POST validate' do
    it 'should redirect to profile page if user is logged in' do
      log_in(@user)
      user = User.gen(:entered_password => "1234")
      post :validate, { :user => { :username => user.username, :password => "1234" } }
      response.should redirect_to "/users/#{@user.id}"
    end

    it 'should validate user, set session, and redirect to profile page' do
      user = User.gen(:entered_password => "1234")
      post :validate, { :user => { :username => user.username, :password => "1234" } }
      response.should redirect_to "/users/#{user.id}"
      session[:user_id].should == user.id
      session[:active].should == user.active
      session[:real_name].should == user.real_name
      session[:guid].should == user.guid
      cookies[:Ssid] = user.guid
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
      is_loggged_in?.should be_true
    end

    it 'should not validate user, and redirect to login page' do
      user = User.gen(:entered_password => "1234")
      post :validate, { :user => { :username => user.username, :password => "4567" } }
      response.should redirect_to "/users/login"
      flash[:error].should_not be_blank
      flash[:notice].should be_blank
      is_loggged_in?.should be_false
    end
  end

  describe 'GET reset_password' do
    it 'should redirect to profile page if user is logged in' do
      log_in(@user)
      user = User.gen(:entered_password => "1234")
      get :reset_password, :guid => @user.guid, :activation_code => @user.verification_code
      response.should redirect_to "/users/#{@user.id}"
    end

    it 'should raise error and redirect to root if invalid parameters' do
      user = User.gen(:entered_password => "1234")
      get :reset_password, :guid => @user.guid, :activation_code => "1234"
      response.should redirect_to "/"
      flash[:error].should_not be_blank
    end

    it 'should render form if parameters are valid' do
      user = User.gen(:entered_password => "1234")
      get :reset_password, :guid => @user.guid, :activation_code => @user.verification_code
      response.should render_template "users/reset_password"
      flash[:error].should be_blank
    end
  end

  describe 'POST reset_password_action' do
    it 'should redirect to profile page if user is logged in' do
      log_in(@user)
      post :reset_password_action
      response.should redirect_to "/users/#{@user.id}"
    end

    it 'should redirect to home page if invalid parameters' do
      post :reset_password_action, { :user => { } }
      response.should redirect_to "/"
      flash[:error].should_not be_blank

      flash.clear

      post :reset_password_action, { :user => { :guid => @user.guid, :activation_code => "1234" } }
      response.should redirect_to "/"
      flash[:error].should_not be_blank
    end

    it 'should apply password validators before update' do
      post :reset_password_action, { :user => {
        :guid => @user.guid,
        :activation_code => @user.verification_code,
        :entered_password => "123",
        :entered_password_confirmation => "123"} }
      response.should redirect_to "/users/reset_password/#{@user.guid}/#{@user.verification_code}"
      flash[:error].should_not be_blank
    end

    it 'should should change password and redirect to login' do
      old_password = @user.password
      post :reset_password_action, { :user => {
        :guid => @user.guid,
        :activation_code => @user.verification_code,
        :entered_password => "1234",
        :entered_password_confirmation => "1234"} }
      @user.reload
      @user.password.should_not == old_password
      @user.password.should == Digest::MD5.hexdigest("1234")
      response.should redirect_to "/users/login"
      flash[:error].should be_blank
      flash[:notice].should_not be_blank
    end
  end

  describe 'GET edit' do
    it 'should redirect to login page if user is not logged_in' do
      get :edit, :id => @user.id
      response.should redirect_to "/users/login"
    end

    it 'should redirect to profile page if editing different user' do
      user = User.gen
      log_in(@user)
      get :edit, :id => user.id
      response.should redirect_to "/users/#{user.id}"
      flash[:error].should_not be_blank
    end

    it 'should render edit form' do
      log_in(@user)
      get :edit, :id => @user.id
      response.should render_template "users/edit"
      flash[:error].should be_blank
    end
  end
  
  describe "activities" do
        before(:each) do
          truncate_table(ActiveRecord::Base.connection, "comments", {})
          truncate_table(ActiveRecord::Base.connection, "collections", {})
          truncate_table(ActiveRecord::Base.connection, "volume_ratings", {})
          truncate_table(ActiveRecord::Base.connection, "collection_ratings", {})
          truncate_table(ActiveRecord::Base.connection, "users", {})
          truncate_table(ActiveRecord::Base.connection, "books", {})
          truncate_table(ActiveRecord::Base.connection, "volumes", {})
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
          # create some activities with different creation time:
          #                         creating new collection
          #                         rating a book
          #                         rating collection
          #                         commented on book
          #                         commented on collection
          @my_collection = Collection.create(:user_id => @user.id, :title => "my collection",:description => "description",:created_at => Time.now, :updated_at => Time.now, :is_public => true)
          @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description",:created_at => Time.now, :updated_at => Time.now, :is_public => false)
          @other_collection = Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description",:created_at => Time.now + 10, :updated_at => Time.now + 10, :is_public => true)
          @appropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @my_collection.id, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 5)
          @appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 4)
          @volume_rating = VolumeRating.create(:user_id => @other_user.id, :volume_id => @vol.id, :rate => 4,:created_at => Time.now + 12)
          @collection_rating = CollectionRating.create(:user_id => @user.id, :collection_id => @my_collection.id, :rate => 4,:created_at => Time.now + 2)
        end
        
        it "should display total number of activities" do
          log_in(@other_user)
          get :show, { :id => @other_user.id, :tab => "activity" }
            response.should have_selector("span", :class => "badge", :content => 2.to_s)
        end
        it "should display name of owner of activity" do
          log_in(@other_user)
          get :show, { :id => @other_user.id, :tab => "activity" }
            response.should have_selector('a', :href => "/users/#{@other_user.id}", :content => "#{@other_user.real_name}")
        end
        
    it "should display  open link of activity component" do
      log_in(@other_user)
      get :show, { :id => @other_user.id, :tab => "activity" }
        response.should have_selector('a', :href => "/collections/#{@other_collection.id}", :content => "#{@other_collection.title}")
        response.should have_selector('a', :href => "/books/#{@vol.job_id}")
    end
#    it "should not display  private collections activity if the owner of activity isn't the current user" do
#      log_in(@other_user)
#      get :show, { :id => @user.id, :tab => "activity" }
#      response.should have_selector("span", :class => "badge", :content => 4.to_s)
#    end
    
    it "should have pagination bar" do
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      20.times {Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description", :updated_at => "2013-11-20 ", :is_public => true)}
       log_in(@other_user)
       get :show, { :id => @other_user.id, :tab => "activity" }
      response.should have_selector('ul', :class => "pagination")
      truncate_table(ActiveRecord::Base.connection, "collections", {})
    end
  end

  describe 'PUT update' do
    
#    it "can upload a photo" do
#        request.accept = "application/json"
#       user_before_update = @user
#       log_in(@user)
#        @file =  Rack::Test::UploadedFile.new('spec/defaultUser.jpeg', 'image/jpg')
#      post :update, { :id => @user.id ,:user => { :id => @user.id, 
#        :username => user_before_update.username,
#        :email => user_before_update.email,
#        :email_confirmation => user_before_update.email,
#        :entered_password => nil,
#        :entered_password_confirmation => nil,
#        :real_name => user_before_update.real_name + "updated",
#        :photo_name => @file}}
#        
#      response.should be_success
#      end
      
    it 'should redirect to login page if user is not logged_in' do
      put :update, { :id => @user.id }
      response.should redirect_to "/users/login"
    end

    it 'should redirect to profile page if editing different user' do
      user = User.gen
      log_in(@user)
      put :update, { :id => user.id }
      response.should redirect_to "/users/#{user.id}"
      flash[:error].should_not be_blank
    end

    it 'should accept modifications even if the password is empty' do
      user_before_update = @user
      log_in(@user)
      put :update, { :id => @user.id ,:user => { :id => @user.id, :username => user_before_update.username,
        :email => user_before_update.email,
        :email_confirmation => user_before_update.email,
        :entered_password => nil,
        :entered_password_confirmation => nil,
        :real_name => user_before_update.real_name + "updated"}}
      expect(response).to redirect_to "/users/#{@user.id}"
      flash[:error].should be_blank
      flash[:notice].should_not be_blank

      @user.reload

      @user.username.should == user_before_update.username
      @user.password.should == user_before_update.password
      @user.email.should == user_before_update.email
      @user.real_name == user_before_update.real_name + "updated"
      session[:real_name].should == @user.real_name
    end

    it 'should reject modifications and redner edit for invalid password' do
      log_in(@user)
      put :update, { :id => @user.id ,:user => { :id => @user.id, :username => @user.username,
        :email => @user.email,
        :email_confirmation => @user.email,
        :entered_password => "123",
        :entered_password_confirmation => "123",
        :real_name => @user.real_name}}
      expect(response).to render_template "users/edit"
    end
  end
end
