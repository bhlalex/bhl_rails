require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login
# Specs in this file have access to a helper object that includes
# the ActivityHelper. For example:
#
# describe ActivityHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end


describe ActivitiesHelper do
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
      @other_collection = Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description",:created_at => Time.now + 10, :updated_at => Time.now + 10, :is_public => true)
      @appropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @my_collection.id, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 5)
      @appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "reply on first book comment",:created_at => Time.now + 4)
      @volume_rating = VolumeRating.create(:user_id => @other_user.id, :volume_id => @vol.id, :rate => 4,:created_at => Time.now + 12)
      @collection_rating = CollectionRating.create(:user_id => @user.id, :collection_id => @my_collection.id, :rate => 4,:created_at => Time.now + 2)
  
    end
  
    describe "all activities" do
      # should return all activities in the system
      before(:each) do
        sql_stmt = "SELECT
        result.table_type AS table_type,
        result.id AS id,
        result.time AS time
        FROM
        (
        (SELECT
            'collection' AS table_type,
            id AS id,
            created_at AS time
            FROM collections WHERE is_public = 1)
        UNION
        (SELECT
            'volume_ratings' AS table_type,
            id AS id,
            created_at AS time
            FROM volume_ratings)
        UNION
        (SELECT
            'collection_ratings' AS table_type,
            id AS id,
            created_at AS time
            FROM collection_ratings)
        UNION
        (SELECT
            'comments' AS table_type,
            id AS id,
            created_at AS time
            FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0)
            ) result
             ORDER BY time DESC;"
        @log_records = get_log_activity(sql_stmt)
      end
  
      it "should return 6 log activities" do
        @log_records.count.should == 6
      end
  
      # log records should returned ordered by time
      # order: rated test book
      #        created other collection
      #        commented on my collection
      #        commented on test book
      #        rated my collection
      #        created my collection
      it "should return log activities ordered by time" do
        @log_records[0][:action].should include("rated")
        @log_records[0][:object_name].should include("Test Book")
        @log_records[1][:action].should include("created")
        @log_records[1][:object_name].should include("other collection")
        @log_records[2][:action].should include("commented")
        @log_records[2][:object_name].should include("my collection")
        @log_records[3][:action].should include("commented")
        @log_records[3][:object_name].should include("Test Book")
        @log_records[4][:action].should include("rated")
        @log_records[4][:object_name].should include("my collection")
        @log_records[5][:action].should include("created")
        @log_records[5][:object_name].should include("my collection")
      end
    end
  
    describe "current user activities" do
      # should return current user activities only
      before(:each) do
        log_in(@user)
        sql_stmt = "SELECT
                result.table_type AS table_type,
                result.id AS id,
                result.time AS time
                FROM((SELECT 'collection' AS table_type,
                    id AS id,
                    created_at AS time
                    FROM collections
                    WHERE is_public = 1
                    and user_id = #{session[:user_id]})
              UNION
                (SELECT
                    'volume_ratings' AS table_type,
                    id AS id,
                    created_at AS time
                    FROM volume_ratings
                    WHERE user_id = #{session[:user_id]})
                UNION
                (SELECT
                    'collection_ratings' AS table_type,
                    id AS id,
                    created_at AS time
                    FROM collection_ratings
                    WHERE user_id = #{session[:user_id]})
                UNION
                (SELECT
                    'comments' AS table_type,
                    id AS id,
                    created_at AS time
                    FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0
                    and user_id = #{session[:user_id]})
                    ) result
                    ORDER BY time DESC;"
        @log_records = get_log_activity(sql_stmt)
      end
  
      it "should return only activities has been made by current user" do
        @log_records.count.should == 4
      end
      # log records should returned ordered by time
      # order: commented on my collection
      #        commented on test book
      #        rated my collection
      #        created my collection
      it "should return log activities ordered by time" do
        @log_records[0][:action].should include("commented")
        @log_records[0][:object_name].should include("my collection")
        @log_records[1][:action].should include("commented")
        @log_records[1][:object_name].should include("Test Book")
        @log_records[2][:action].should include("rated")
        @log_records[2][:object_name].should include("my collection")
        @log_records[3][:action].should include("created")
        @log_records[3][:object_name].should include("my collection")
      end
    end
  
  end

