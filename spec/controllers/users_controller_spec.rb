require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login

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
      expect(response).to redirect_to("/users/show/#{@user.id}")
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
        response.should have_selector("a", :href => "/users/#{@user[:id]}/profile", :content => I18n.t(:user_profile))
      end

      it "should link to recently_viewed when user is logged in" do
        get :show, :id => @user.id
        response.should have_selector("a", :href => "/users/#{@user[:id]}/recently_viewed", :content => I18n.t(:recently_viewed))
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
          solr = RSolr.connect :url => SOLR_BOOKS_METADATA
          solr.delete_by_query('*:*')
          solr.commit
          solr.add doc_test_first
          solr.commit
          @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
          @vol_first = Volume.gen(:book => @book_test_first, :job_id => '123', :get_thumbnail_fail => 0)
          UserBookHistory.create(:volume_id => @vol_first.id, :user_id => @user.id, :last_visited_date => Time.now)
        end
        it "should have book title links to details page" do
          get :show, :id => @user.id
          response.should have_selector("a", :href => "/books/#{@vol_first.job_id}/brief")
        end
        it "should have book image links to read page" do
          get :show, :id => @user.id
          response.should have_selector("img", :src => "/volumes/#{@vol_first.job_id}/thumb.jpg")
          response.should have_selector("a", :href => "/books/#{@vol_first.job_id}/read")
        end
        it "should have recently viewed link" do
          get :show, :id => @user.id
          response.should have_selector("a", :href => "/users/#{@user.id}/recently_viewed")
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
                    
          UserBookHistory.create(:volume_id => @vol_first.id, :user_id => @user.id, :last_visited_date => Time.now)
          UserBookHistory.create(:volume_id => @vol_second.id, :user_id => @user.id, :last_visited_date => Time.now)
        end
        
        # check for existance of By:authors label in list view
        it "should have by author" do
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should have_selector("div", :class => "description", :content => "By")
        end
        
        it "should display last visited date" do
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should have_selector("div", :class => "visitedtime", :content => "Last visited: #{(UserBookHistory.first).last_visited_date}")
        end
                
        #TODO now this will not pass except after fixing jquery problems
#        it "should have open links for names" do
#          get :show, :id => @user.id, :tab => "recently_viewed"
#          response.should have_selector('a', :href => "/books?_name=Name1", :content => "Name1 (1)")
#          response.should have_selector('a', :href => "/books?_name=Name2", :content => "Name2 (2)")
#          response.should have_selector('a', :href => "/books?_name=Name3", :content => "Name3 (1)")
#        end
               
        it "should not exists if user is not logged in" do
          log_out
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should redirect_to :controller => :users, :action => :login
        end
        # check for books count
        it "should have item count equal to the total number of books" do
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should have_selector("div", :class => "count", :content => 2.to_s)
        end
        # check for existance of gallery and list view options
        it "should have links for gallery and list views" do
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should have_selector('a', :href => "/users/1/recently_viewed?view=list")
          response.should have_selector("a", :href => "/users/1/recently_viewed?view=gallery")
        end
        it "should have images for gallery and list views" do
          get :show, :id => @user.id, :tab => "recently_viewed"
          response.should have_selector("a>img", :src => "/images_en/list.png")
          response.should have_selector("a>img", :src => "/images_en/gallery.png")
        end

        describe "'list view'" do

          before(:each) do
            get :show, :id => @user.id, :tab => "recently_viewed", :view => "list"
          end

          # check for existance of image for each book in list view
          it "should have an image for each book" do
            response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
            response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
          end

          # check for existance of detail link for each book_title in list view
          it "should have book title that links for details" do
            response.should have_selector('a', :href => "/books/123/brief" ,:content => "Test Book First")
            response.should have_selector('a', :href => "/books/238233/brief", :content => "Test Book Second")
          end

          # check for existance of read and detail links for each book in list view
          it "should have read and detail links for each book" do
            response.should have_selector('a', :href => "/books/123/read")
            response.should have_selector('a', :href => "/books/123/brief")
            response.should have_selector('a', :href => "/books/238233/read")
            response.should have_selector('a', :href => "/books/238233/brief")
          end

          # check for existance of read and detail images for each book in list view
          it "should have read and detail images for each book in list view" do
            response.should have_selector('img', :src => "/images_en/read.png")
            response.should have_selector('img', :src => "/images_en/learn.png")
          end

          # delete link
          describe "'delete link'" do
            it "should delete history and decrease the number of books found when click on delete link" do
              get "remove_book_history", :page => 1, :tab => "recently_viewed", :id =>@user.id, :user_id => @user.id, :volume_id => 1
              response.should redirect_to :controller => :users, :action => :show, :id => 1, :tab => "recently_viewed", :page => 1
              get :show, :id => 1, :tab => "recently_viewed", :page => 1
              response.should have_selector("div", :class => "count", :content => 1.to_s)
            end
            it "should have delete image" do
              log_in(@user)
              get :show, :id => @user.id, :tab => "recently_viewed", :view => "list"
              response.should have_selector("img", :src => "/images_en/trash_delete.png")
            end

            it "should not delete when user is not logged in" do
              log_out
              get "remove_book_history", :page => 1, :tab => "recently_viewed", :user_id => @user.id, :volume_id => 1
              response.should redirect_to :controller => :users, :action => :login
            end

            describe "'pagination'" do
              before(:each) do
                truncate_table(ActiveRecord::Base.connection, "books", {})
                truncate_table(ActiveRecord::Base.connection, "volumes", {})
                truncate_table(ActiveRecord::Base.connection, "user_book_histories", {})
                solr = RSolr.connect :url => SOLR_BOOKS_METADATA
                12.times{ |i|
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
                  @book = Book.gen(:title => 'Test Book', :bibid => '456')
                  @volume = Volume.gen(:book_id => @book.id, :job_id => i.to_s, :get_thumbnail_fail => 0)
                  UserBookHistory.create(:user_id => @user.id, :volume_id => @volume.id, :last_visited_date => Time.now)
                }
              end
              it "should redirect to the same page" do
                get "remove_book_history", :page => 2, :tab => "recently_viewed", :id => @user.id, :user_id => @user.id, :volume_id => UserBookHistory.last[:volume_id]
                response.should redirect_to :controller => :users, :action => :show, :id => @user.id, :tab => "recently_viewed", :page => 2
              end

              it "should fix pagination after deleting the last book in current page" do
                get "remove_book_history", :page => 2, :tab => "recently_viewed", :id => @user.id,:user_id => @user.id, :volume_id => UserBookHistory.last[:volume_id]
                get "remove_book_history", :page => 2, :tab => "recently_viewed", :id => @user.id,:user_id => @user.id, :volume_id => UserBookHistory.last[:volume_id]
                #              http://localhost:3000/users/34/recently_viewed
                get :show, :id => @user.id,:page => 2, :tab => "recently_viewed", :view => "list"
                response.should redirect_to :controller => :users, :action => :show, :id => 1, :tab => "recently_viewed", :page => 1
              end
            end
          end
        end

        describe "'gallery view'" do

          before(:each) do
            get :show, :id => @user.id, :tab => "recently_viewed", :view => "gallery"
          end

          # check for existance of image for each book in gallery view
          it "should have an image for each book" do
            response.should have_selector('a>img', :src => "/volumes/123/thumb.jpg")
            response.should have_selector('a>img', :src => "/volumes/238233/thumb.jpg")
          end

          # check for existance of detail link for each book in gallery view
          it "should have detail link for each book" do
            response.should have_selector('a', :href => "/books/123/brief" ,:content => "Test Book First")
            response.should have_selector('a', :href => "/books/238233/brief", :content => "Test Book Second")
          end
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

      it "should contains query content body" do
        get :show, { :id => @user.id, :tab => "saved_queries" }
        response.should have_selector("b", :content => "Title")
        response.should have_selector("b", :content => "Content")
      end

      it "should contains query date body" do
        get :show, { :id => @user.id, :tab => "saved_queries" }
        response.should have_selector("b", :content => "Saved at")
      end

      it "should contains show result link for query" do
        get :show, { :id => @user.id, :tab => "saved_queries" }
        response.should have_selector('a', :href => "/books?_title=popular")
        response.should have_selector('a', :href => "/books?_content=smith")
      end

      it "should contains delete link for each query" do
        get :show, { :id => @user.id, :tab => "saved_queries" }
        response.should have_selector('a', :href => "/user_search_history/delete_query/#{@query_first.id}")
        response.should have_selector('a', :href => "/user_search_history/delete_query/#{@query_second.id}")
      end

      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "queries", {})
        20.times {Query.create(:user_id => @user.id, :string => "_title=popular")}
        get :show, { :id => @user.id, :tab => "saved_queries" }
        response.should have_selector('ul', :id => "pagination")
        truncate_table(ActiveRecord::Base.connection, "queries", {})
      end

    end
    # end


    describe "list collections" do
      before(:each) do
        @other_user = User.gen

        truncate_table(ActiveRecord::Base.connection, "collections", {})
        @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description", :updated_at => "2013-11-20 ", :status => false)
        @my_public_collection = Collection.create(:user_id => @user.id, :title => "my public collection",:description => "description", :updated_at => "2013-11-19 ", :status => true)
        @other_private_collection = Collection.create(:user_id => @other_user.id, :title => "other private collection",:description => "description", :updated_at => "2013-11-18 ", :status => false)
        @other_public_collection = Collection.create(:user_id => @other_user.id, :title => "other public collection",:description => "description", :updated_at => "2013-11-17 ", :status => true)

      end
      it "should list current user's collections " do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('div', :class => "count", :content =>2.to_s)
      end

      it "should list public collections of other user" do
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('div', :class => "count", :content =>1.to_s)
      end

      it "should have an open link for public collections of other user" do
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/show/#{@other_public_collection.id}", :content =>@other_public_collection.title)
      end
      it "should have last modified date for public collections of ther user" do
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('h5', :content =>"2013-11-17")
      end

      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "collections", {})
        20.times {Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description", :updated_at => "2013-11-20 ", :status => true)}
        get :show, { :id => @other_user.id, :tab => "collections" }
        response.should have_selector('ul', :id => "pagination")
        truncate_table(ActiveRecord::Base.connection, "collections", {})
      end

      it "should have an open link for each collection of my collections" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/show/#{@my_private_collection.id}", :content =>@my_private_collection.title)
        response.should have_selector('a', :href => "/collections/show/#{@my_public_collection.id}", :content =>@my_public_collection.title)
      end
      it "should have last modified date for each collection" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('h5', :content =>"2013-11-20")
        response.should have_selector('h5', :content =>"2013-11-19")
      end
      it "should have an image for each collection" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a>img', :src => "/images_en/defaultCollection.jpg")
      end

      it "should have an meta data link for each collection" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/show/#{@my_private_collection.id}")
        response.should have_selector('a', :href => "/collections/show/#{@my_public_collection.id}")
      end

      it "should have delete link for the collections owned by the current user" do
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('a', :href => "/collections/destroy_collection/#{@my_private_collection.id}")
        response.should have_selector('a', :href => "/collections/destroy_collection/#{@my_public_collection.id}")
      end
      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "collections", {})
        20.times {Collection.create(:user_id => @user.id, :title => "my collection",:description => "description", :updated_at => "2013-11-20 ", :status => false)}
        get :show, { :id => @user.id, :tab => "collections" }
        response.should have_selector('ul', :id => "pagination")
        truncate_table(ActiveRecord::Base.connection, "collections", {})
      end

    end
  end

  describe 'GET forgot_password' do
    it 'should not render forget_password if logged in' do
      log_in(@user)
      get :forgot_password
      response.should_not render_template('users/forgot_password')
      expect(response).to redirect_to("/users/show/#{@user.id}")
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
      expect(response).to redirect_to("/users/show/#{@user.id}")
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
      expect(response).to redirect_to("/users/show/#{@user.id}")
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
      response.should redirect_to "/users/show/#{user.id}"
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
      response.should redirect_to "/users/show/#{@user.id}"
    end

    it 'should validate user, set session, and redirect to profile page' do
      user = User.gen(:entered_password => "1234")
      post :validate, { :user => { :username => user.username, :password => "1234" } }
      response.should redirect_to "/users/show/#{user.id}"
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
      response.should redirect_to "/users/show/#{@user.id}"
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
      response.should redirect_to "/users/show/#{@user.id}"
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
      response.should redirect_to "/users/show/#{user.id}"
      flash[:error].should_not be_blank
    end

    it 'should render edit form' do
      log_in(@user)
      get :edit, :id => @user.id
      response.should render_template "users/edit"
      flash[:error].should be_blank
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
      response.should redirect_to "/users/show/#{user.id}"
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
      expect(response).to redirect_to "/users/show/#{@user.id}"
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
