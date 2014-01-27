require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login
describe UserSearchHistoryController do
   describe "saved queries" do
      before(:each) do
        truncate_table(ActiveRecord::Base.connection, "users", {})
        truncate_table(ActiveRecord::Base.connection, "queries", {})
        User.gen() unless User.first
        @user = User.first
        log_in(@user)
        @query = Query.create(:user_id => @user.id, :string => "_content=smith")
      end

      it "should save the query" do
        request.env["HTTP_REFERER"] = "/books?_content=ras"
        lambda do
        post :save_query, :query => "_content=smith", :user_id =>@user.id
        response.should redirect_to("/books?_content=ras")
        end.should change(Query, :count).by(1)
      end

    it "should destroy the query" do
      request.env["HTTP_REFERER"] = "/users/#{@user.id}"
      lambda do
      delete :delete_query, :id => @query
      response.should redirect_to("/users/#{@user.id}")
      end.should change(Query, :count).by(-1)
    end
   end
    
  describe "'recently_viewed tab'" do

    before(:each) do
      User.gen() unless User.first
      @user = User.first
      log_in(@user)
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
      truncate_table(ActiveRecord::Base.connection, "users", {})

    end
    
    # delete link
    describe "'delete link'" do
      it "should delete history and decrease the number of books found when click on delete link" do
        User.gen() unless User.first
        user = User.first
        log_in(user)
        get "remove_book_history", :page => 1, :tab => "history", :id => user.id, :user_id => user.id, :volume_id => 1
        response.should redirect_to :controller => :users, :action => :show, :id => user.id, :tab => "history", :page => 1
      end
   
      it "should not delete when user is not logged in" do
        log_out
        get "remove_book_history", :page => 1, :tab => "history", :user_id => @user.id, :volume_id => 1
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
            doc_test[:single_bok_title] = "title"

            # remove this book if exists
            solr.delete_by_query('vol_jobid:'+i.to_s)
            solr.commit
            solr.add doc_test
            solr.commit
            @book = Book.gen(:title => 'Test Book', :bibid => '456')
            @volume = Volume.gen(:book_id => @book.id, :job_id => i.to_s, :get_thumbnail_fail => 0)
            UserBookHistory.create(:user_id => @user.id, :volume_id => @volume.id, :updated_at => Time.now)
          }
        end
        
        it "should redirect to the same page" do
          User.gen() unless User.first
          user = User.first
          log_in(user)
          get "remove_book_history", :page => 2, :tab => "history", :id => user.id, :user_id => user.id, :volume_id => UserBookHistory.last[:volume_id]
          response.should redirect_to :controller => :users, :action => :show, :id => user.id, :tab => "history", :page => 2
        end
      end
    end
    end
end