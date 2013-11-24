require 'spec_helper'

describe CollectionsController do
 
  describe "add book" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "book_collections", {}) 
      doc_test_first = {:vol_jobid => "123", :bok_bibid => "456"}
      doc_test_first[:bok_title] = "Test Book First"
 
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      solr.add doc_test_first
      solr.commit
      User.gen() unless User.first
      @user = User.first
      @book = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol = Volume.gen(:book => @book, :job_id => '123', :get_thumbnail_fail => 0)
      @collection = Collection.gen(:user => @user)
    end
    
    describe "add book to new collection" do
      it "should create new collection" do
        begin
          lambda do
            get :add_book, :title => "title", :description => "description", :public => "on", :col_id => nil, :id => 123
          end.should change(Collection, :count).by(1)
          rescue ActionView::MissingTemplate
        end
      end
      
      it "should create new collection with the right parameters" do
        begin
          get :add_book, :title => "title", :description => "description", :public => "on", :col_id => nil, :id => 123
          rescue ActionView::MissingTemplate
          Collection.last.title.should == "title"
          Collection.last.status.should == true
          Collection.last.description.should == "description"
        end
      end
      
      it "should refuse new collection with no title" do
        begin
          lambda do
            get :add_book, :title => "", :description => "description", :public => "on", :col_id => nil, :id => 123
          end.should_not change(Collection, :count)
          rescue ActionView::MissingTemplate
        end
      end
    end
    
    describe "add book to pre exist collection" do
      it "should create a new BookCollection" do
        begin
          lambda do
            get :add_book, :col_id => @collection.id, :id => 123
          end.should_not change(Collection, :count).by(1)
          rescue ActionView::MissingTemplate
        end
      end
      it "should create a new BookCollection with ight order" do
        begin
          get :add_book, :col_id => @collection.id, :id => 123
          rescue ActionView::MissingTemplate
          BookCollection.last.position.should == 1
        end
      end
    end
  end
end