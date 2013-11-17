require 'spec_helper'
include BHL::Login

describe "users/show.html.haml" do
  
  # delete link
  describe "'delete link'" do
  before(:each) do
     truncate_table(ActiveRecord::Base.connection, "users", {})
     User.gen() unless User.first
     @user = User.first
     
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
       @volume = Volume.gen(:book => @book_test, :job_id => i.to_s, :get_thumbnail_fail => 0)
       UserBookHistory.create(:user_id => @user.id, :volume_id => @volume.id, :last_visited_date => Time.now)
     }
   end
   
  it "should fix pagination after deletion" do
    visit "/users/show/1?tab=history"
    visit "/users/remove_book_history?page=2&user_id=1&volume_id=#{Volume.last.id}"
  #      visit "remove_book_history", :page => 2, :tab => "history", :user_id => @user.id, :volume_id => UserBookHistory.last[:volume_id]
  #      response.should redirect_to :controller => :users, :action => :show, :id => 1, 
  #      :tab => "history", :page => 2
  #      UserBookHistory.where(:user_id => @user.id).count.should eq(11)
  #      visit "remove_book_history", :page => 2, :tab => "history", :user_id => @user.id, :volume_id => UserBookHistory.last[:volume_id]
  #      UserBookHistory.where(:user_id => @user.id).count.should eq(10)
  #      response.should redirect_to :controller => :users, :action => :show, :id => 1, 
  #      :tab => "history", :page => 2
    current_url.should == "http://localhost:3000/users/show/1?page=1&tab=history"
    end
  end
end