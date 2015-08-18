require 'spec_helper'
include BHL::Login
describe "pages" do
  describe "log activity" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      @user = User.gen()
      @other_user = User.gen()
      
      truncate_table(ActiveRecord::Base.connection, "comments", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "volume_ratings", {})
      truncate_table(ActiveRecord::Base.connection, "collection_ratings", {})
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
      @my_collection = Collection.create(:user_id => @user.id, :title => "my collection",:description => "description",:created_at => Time.now, :updated_at => Time.now, :is_public => true)
      @other_collection = Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description",:created_at => Time.now + 10, :updated_at => Time.now + 10, :is_public => true)
      @appropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @my_collection.id, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 5)
      @appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 4)
      @volume_rating = VolumeRating.create(:user_id => @other_user.id, :volume_id => @vol.id, :rate => 4,:created_at => Time.now + 12)
      @collection_rating = CollectionRating.create(:user_id => @user.id, :collection_id => @my_collection.id, :rate => 4,:created_at => Time.now + 2)
    end
    
    it "should display total number of users activities", :js => true do
      #show home page
      visit("/")
      expect(page).to have_selector('span', :class => "badge", :content => 6.to_s)
    end
    
    it "should display open link for each user made an activity", :js => true do
      #show home page
      visit("/")
      expect(page).to have_selector('a', :href => "/users/#{@user.id}", :content => "#{@user.real_name}")
      expect(page).to have_selector('a', :href => "/users/#{@other_user.id}", :content => "#{@other_user.real_name}")
    end
    
    it "should display open link for different types of activities", :js => true
  end
end