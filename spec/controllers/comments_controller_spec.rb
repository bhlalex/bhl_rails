require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login
describe CommentsController do
  render_views
  before(:each) do
  truncate_table(ActiveRecord::Base.connection, "comments", {})
  truncate_table(ActiveRecord::Base.connection, "books", {})
  truncate_table(ActiveRecord::Base.connection, "volumes", {})
  truncate_table(ActiveRecord::Base.connection, "collections", {})
  truncate_table(ActiveRecord::Base.connection, "users", {})
  @book = Book.create(:title => 'Test Book First', :bibid => '456')
  @vol = Volume.create(:book => @book, :job_id => '123', :get_thumbnail_fail => 0)
  solr = RSolr.connect :url => SOLR_BOOKS_METADATA
  solr.delete_by_query('*:*')
  solr.commit
  doc = {:vol_jobid => "123", :bok_bibid => "456"}
  doc[:bok_title] = "Test Book"
  solr = RSolr.connect :url => SOLR_BOOKS_METADATA
  solr.add doc
  solr.commit
  User.gen() unless User.first
  @user = User.first
  log_in(@user)
  
  @collection = Collection.create(:user_id => @user.id, :title => "collection",:description => "description", :last_modified_date => Date.today, :status => true)
  @first_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "first book comment")
  @second_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "second book comment")
  @first_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => nil, :text => "first collection comment")
  @first_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => nil, :text => "second collection comment")
end
  
  describe "list comments" do
    describe "list comments for a book" do
      it "should list all comments of a book" do
        get "/books/#{@vol.job_id}"
        response.should have_selector("div", :id => "comment#{@first_book_comment.id}")
      end
      
    end
    
    describe "list comments for a collection" do
      
    end
  end
  
  describe "create comment" do
    describe "create new comment on book" do
      
    end
    
    describe "create new comment on collection" do
      
    end
  end
  
  describe "abuse comment" do
    describe "abuse comment for a book" do
      
    end
    
    describe "abuse comment for collection" do
      
    end
  end
  
  describe "reply on comment" do
    describe "reply on book comment" do
      
    end
    
    describe "reply on collection comment" do
      
    end
  end
  
  describe "delete comment" do
    describe "delete book comment" do
      
    end
    
    describe "delete collection comment" do
      
    end
  end
end