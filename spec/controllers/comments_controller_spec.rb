require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login
describe CommentsController do
  render_views
  before(:each) do
    truncate_table(ActiveRecord::Base.connection, "comments", {})
    truncate_table(ActiveRecord::Base.connection, "collections", {})
    truncate_table(ActiveRecord::Base.connection, "books", {})
    truncate_table(ActiveRecord::Base.connection, "volumes", {})
    truncate_table(ActiveRecord::Base.connection, "users", {})
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
    log_in(@user)

    @collection = Collection.create(:user_id => @user.id, :title => "collection",:description => "description", :updated_at => Date.today, :is_public => true)
    @appropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => nil, :text => "reply on first book comment")
    @reply_of_appropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => @appropriate_collection_comment.id, :text => "first book comment")
    @inappropriate_collection_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => nil, :text => "second book comment", :number_of_marks => 2)
    @appropriate_collection_comment_without_replies = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => @collection.id, :comment_id => nil, :text => "book comment")

    @appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "reply on first book comment")
    @reply_of_appropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => nil, :collection_id => nil, :comment_id => @appropriate_book_comment.id, :text => "first book comment")
    @inappropriate_book_comment = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "second book comment", :number_of_marks => 2)
    @appropriate_book_comment_without_replies = Comment.create(:user_id => @user.id, :volume_id => @vol.id, :collection_id => nil, :comment_id => nil, :text => "book comment")
  end

  describe "create comment" do
    describe "create new comment on book" do
      it "should craete comment with valid paramters" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          post :create, :comment => {:text => "new comment", :volume_id => @vol.id, :collection_id => nil, :user_id => @user.id, :comment_id => nil}
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should change(Comment, :count).by(1)
      end

      it "should not craete comment with invalid paramters" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          post :create, :comment => {:text => "", :volume_id => @vol.id, :collection_id => nil, :user_id => @user.id, :comment_id => nil}
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should_not change(Comment, :count)
      end
    end

    describe "create new comment on collection" do
      it "should craete comment with valid paramters" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          post :create, :comment => {:text => "new comment", :volume_id => nil, :collection_id => @collection.id, :user_id => @user.id, :comment_id => nil}
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should change(Comment, :count).by(1)
      end

      it "should not craete comment with invalid paramters" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          post :create, :comment => {:text => "", :volume_id => nil, :collection_id => @collection.id, :user_id => @user.id, :comment_id => nil}
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should_not change(Comment, :count)
      end

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
      it "should craete reply with valid paramters" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          post :create, :comment => {:text => "new reply", :volume_id => nil, :collection_id => nil, :user_id => @user.id, :comment_id => @appropriate_book_comment}
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should change(Comment, :count).by(1)
      end

      it "should not craete reply with invalid paramters" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          post :create, :comment => {:text => "", :volume_id => nil, :collection_id => nil, :user_id => @user.id, :comment_id => @appropriate_book_comment}
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should_not change(Comment, :count)
      end

    end

    describe "reply on collection comment" do
      it "should craete reply with valid paramters" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          post :create, :comment => {:text => "new comment", :volume_id => nil, :collection_id => nil, :user_id => @user.id, :comment_id => @appropriate_collection_comment}
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should change(Comment, :count).by(1)
      end

      it "should not craete reply with invalid paramters" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          post :create, :comment => {:text => "", :volume_id => nil, :collection_id => nil, :user_id => @user.id, :comment_id => @appropriate_collection_comment}
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should_not change(Comment, :count)
      end

    end
  end

  describe "delete comment" do
    describe "delete book comment without replies" do
      it "should delete comment" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          delete :delete, :id => @appropriate_book_comment_without_replies
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should change(Comment, :count).by(-1)
      end
      
      it "should not delete comment with replies" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          delete :delete, :id => @appropriate_book_comment
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should_not change(Comment, :count)
      end
      
      it "should delete reply" do
        request.env["HTTP_REFERER"] = "/books/#{@vol.job_id}"
        lambda do
          delete :delete, :id => @reply_of_appropriate_book_comment
          response.should redirect_to("/books/#{@vol.job_id}")
        end.should change(Comment, :count).by(-1)
      end
    end

    describe "delete collection comment" do
      it "should delete comment" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          delete :delete, :id => @appropriate_book_comment_without_replies
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should change(Comment, :count).by(-1)
      end
      
      it "should not delete comment with replies" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          delete :delete, :id => @appropriate_book_comment
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should_not change(Comment, :count)
      end
      
      it "should delete reply" do
        request.env["HTTP_REFERER"] = "/collections/show/#{@collection.id}"
        lambda do
          delete :delete, :id => @reply_of_appropriate_book_comment
          response.should redirect_to("/collections/show/#{@collection.id}")
        end.should change(Comment, :count).by(-1)
      end

    end
  end
end