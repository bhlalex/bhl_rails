require 'spec_helper'

require_relative '../../lib/bhl/login'

include BHL::Login
describe CollectionsController do
  render_views
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
      @collection = Collection.gen(:user => @user, :title => "title", :description => "description")
    end

    describe "add book to new collection" do
      it "should create new collection" do
        begin
          lambda do
            get :add_book, :title => "title", :description => "description", :public => "on", :col_id => nil, :vol_id => 123
          end.should change(Collection, :count).by(1)
        rescue ActionView::MissingTemplate
        end
      end
      
      it "should create new collection and add book to it" do
        begin
          lambda do
            get :add_book, :title => "title", :description => "description", :public => "on", :col_id => nil, :vol_id => 123
          end.should change(BookCollection, :count).by(1)
          rescue ActionView::MissingTemplate
        end
      end
      
      it "should create new collection with the right parameters" do
        begin
          get :add_book, :title => "title", :description => "description", :public => "on", :col_id => nil, :vol_id => 123
          rescue ActionView::MissingTemplate
          Collection.last.title.should == "title"
          Collection.last.status.should == true
          Collection.last.description.should == "description"
        end
      end

      it "should refuse new collection with no title" do
        begin
          lambda do
            get :add_book, :title => "", :description => "description", :public => "on", :col_id => nil, :vol_id => 123
          end.should_not change(Collection, :count)
        rescue ActionView::MissingTemplate
        end
      end
    end

    describe "add book to pre exist collection" do
      it "should create a new BookCollection" do
        begin
          lambda do
            get :add_book, :col_id => @collection.id, :vol_id => 123
          end.should_not change(Collection, :count).by(1)
        rescue ActionView::MissingTemplate
        end
      end
      it "should create a new BookCollection with ight order" do
        begin
          get :add_book, :col_id => @collection.id, :vol_id => 123
          rescue ActionView::MissingTemplate
          BookCollection.last.position.should == 1
        end
      end
    end
  end

  describe "manage collections" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      User.gen() unless User.first
      @user = User.first
      log_in(@user)
      @other_user = User.gen

      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      @book_test_first = Book.gen(:title => 'Test Book First', :bibid => '456')
      @vol_first = Volume.gen(:book => @book_test_first, :job_id => '1', :get_thumbnail_fail => 0)
      @vol_second = Volume.gen(:book => @book_test_first, :job_id => '2', :get_thumbnail_fail => 0)
      @vol_third = Volume.gen(:book => @book_test_first, :job_id => '3', :get_thumbnail_fail => 0)

      truncate_table(ActiveRecord::Base.connection, "collections", {})
      @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description", :last_modified_date => Date.today, :status => false)
      @my_public_collection = Collection.create(:user_id => @user.id, :title => "my public collection",:description => "description", :last_modified_date => Date.today, :status => true)
      @other_public_collection = Collection.create(:user_id => @other_user.id, :title => "other private collection",:description => "description", :last_modified_date => Date.today, :status => true)

      truncate_table(ActiveRecord::Base.connection, "book_collections", {})
      @book_in_my_private_collection = BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @vol_first.id, :position => 1)
      @second_book_in_my_private_collection = BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @vol_second.id, :position => 2)
      @third_book_in_my_private_collection = BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @vol_third.id, :position => 3)

      @book_in_my_public_collection = BookCollection.create(:collection_id => @my_public_collection.id, :volume_id => @vol_first.id, :position => 1)
      @second_book_in_my_public_collection = BookCollection.create(:collection_id => @my_public_collection.id, :volume_id => @vol_second.id, :position => 2)
      @third_book_in_my_public_collection = BookCollection.create(:collection_id => @my_public_collection.id, :volume_id => 3, :position => 3)

      @book_in_other_collection = BookCollection.create(:collection_id => @other_public_collection.id, :volume_id => @vol_first.id, :position => 1)
      @second_book_in_other_collection = BookCollection.create(:collection_id => @other_public_collection.id, :volume_id => @vol_second.id, :position => 2)
      @third_book_in_other_collection = BookCollection.create(:collection_id => @other_public_collection.id, :volume_id => @vol_third.id, :position => 3)

    end

    describe "list books in collections" do

      describe "open my private collection" do

        it "should list all books in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('div', :class => "count", :content =>3.to_s)
        end

        it "should have an open link for each book in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/read")
        end

        it "should have a brief link for each book in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/brief")
        end

        it "should display order for each book in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('h5', :content => 1.to_s)
          response.should have_selector('h5', :content => 2.to_s)
          response.should have_selector('h5', :content => 3.to_s)
        end

        it "should display sort links for each book in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('a', :href => "/collections/move_down/#{@book_in_my_private_collection.id}")
          response.should have_selector('a', :href => "/collections/move_up/#{@second_book_in_my_private_collection.id}")
          response.should have_selector('a', :href => "/collections/move_down/#{@second_book_in_my_private_collection.id}")
          response.should have_selector('a', :href => "/collections/move_up/#{@third_book_in_my_private_collection.id}")
        end

        it "should have a delete link for each book in my private collection" do
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('a', :href => "/collections/delete_book/#{@book_in_my_private_collection.id}")
          response.should have_selector('a', :href => "/collections/delete_book/#{@second_book_in_my_private_collection.id}")
          response.should have_selector('a', :href => "/collections/delete_book/#{@third_book_in_my_private_collection.id}")
        end

        it "should have pagination bar" do
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
          20.times { |i| BookCollection.create(:collection_id => @my_private_collection.id, :volume_id => @vol_first.id, :position => i)}
          get :list_books_in_collection, :id => @my_private_collection
          response.should have_selector('ul', :id => "pagination")
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
        end

        describe "delete book from collection" do
          it "should delete book from collection" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_private_collection.id}"
            lambda do
              get :delete_book, :book_collection_id => @second_book_in_my_private_collection
              response.should redirect_to("/collections/list_books_in_collection/#{@my_private_collection.id}")
              @third_book_in_my_private_collection.position == 2
            end.should change(BookCollection, :count).by(-1)
          end
        end

        describe "sort books in collection" do
          it "should change book order to higher order" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_private_collection.id}"
            get :move_up, :book_collection_id => @second_book_in_my_private_collection
            response.should redirect_to("/collections/list_books_in_collection/#{@my_private_collection.id}")
            @second_book_in_my_private_collection.position == 1
            @book_in_my_private_collection.position == 2
          end

          it "should change book order to lower order" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_private_collection.id}"
            get :move_down, :book_collection_id => @second_book_in_my_private_collection
            response.should redirect_to("/collections/list_books_in_collection/#{@my_private_collection.id}")
            @second_book_in_my_private_collection.position == 3
            @third_book_in_my_private_collection.position == 2
          end
        end
      end

      describe "open my public collection" do

        it "should list all books in my private collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('div', :class => "count", :content =>3.to_s)
        end

        it "should have an open link for each book in my public collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/read")
        end

        it "should have a brief link for each book in my public collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/brief")
        end

        it "should display order for each book in my public collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('h5', :content => 1.to_s)
          response.should have_selector('h5', :content => 2.to_s)
          response.should have_selector('h5', :content => 3.to_s)
        end

        it "should display sort links for each book in my public collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('a', :href => "/collections/move_down/#{@book_in_my_public_collection.id}")
          response.should have_selector('a', :href => "/collections/move_up/#{@second_book_in_my_public_collection.id}")
          response.should have_selector('a', :href => "/collections/move_down/#{@second_book_in_my_public_collection.id}")
          response.should have_selector('a', :href => "/collections/move_up/#{@third_book_in_my_public_collection.id}")
        end

        it "should have a delete link for each book in my public collection" do
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('a', :href => "/collections/delete_book/#{@book_in_my_public_collection.id}")
          response.should have_selector('a', :href => "/collections/delete_book/#{@second_book_in_my_public_collection.id}")
          response.should have_selector('a', :href => "/collections/delete_book/#{@third_book_in_my_public_collection.id}")
        end

        it "should have pagination bar" do
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
          20.times { |i| BookCollection.create(:collection_id => @my_public_collection.id, :volume_id => @vol_first.id, :position => i)}
          get :list_books_in_collection, :id => @my_public_collection
          response.should have_selector('ul', :id => "pagination")
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
        end

        describe "delete book from collection" do
          it "should delete book from collection" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_public_collection.id}"
            lambda do
              get :delete_book, :book_collection_id => @second_book_in_my_public_collection
              response.should redirect_to("/collections/list_books_in_collection/#{@my_public_collection.id}")
              @third_book_in_my_public_collection.position == 2
            end.should change(BookCollection, :count).by(-1)
          end
        end

        describe "sort books in collection" do
          it "should change book order to higher order" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_public_collection.id}"
            get :move_up, :book_collection_id => @second_book_in_my_public_collection
            response.should redirect_to("/collections/list_books_in_collection/#{@my_public_collection.id}")
            @second_book_in_my_public_collection.position == 1
            @book_in_my_public_collection.position == 2
          end

          it "should change book order to lower order" do
            request.env["HTTP_REFERER"] = "/collections/list_books_in_collection/#{@my_public_collection.id}"
            get :move_down, :book_collection_id => @second_book_in_my_public_collection
            response.should redirect_to("/collections/list_books_in_collection/#{@my_public_collection.id}")
            @second_book_in_my_public_collection.position == 3
            @third_book_in_my_public_collection.position == 2
          end
        end
      end

      describe "open other public collection" do

        it "should list all books in other private collection" do
          get :list_books_in_collection, :id => @other_public_collection
          response.should have_selector('div', :class => "count", :content =>3.to_s)
        end

        it "should have an open link for each book in other public collection" do
          get :list_books_in_collection, :id => @other_public_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/read")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/read")
        end

        it "should have a brief link for each book in other public collection" do
          get :list_books_in_collection, :id => @other_public_collection
          response.should have_selector('a', :href => "/books/#{@vol_first.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_second.id}/brief")
          response.should have_selector('a', :href => "/books/#{@vol_third.id}/brief")
        end

        it "should display order for each book in other public collection" do
          get :list_books_in_collection, :id => @other_public_collection
          response.should have_selector('h5', :content => 1.to_s)
          response.should have_selector('h5', :content => 2.to_s)
          response.should have_selector('h5', :content => 3.to_s)
        end

        it "should have pagination bar" do
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
          20.times { |i| BookCollection.create(:collection_id => @other_public_collection.id, :volume_id => @vol_first.id, :position => i)}
          get :list_books_in_collection, :id => @other_public_collection
          response.should have_selector('ul', :id => "pagination")
          truncate_table(ActiveRecord::Base.connection, "book_collections", {})
        end
      end
    end

    describe "destroy collection" do
      it "should destroy my private collection" do
        request.env["HTTP_REFERER"] = "/users/#{@user.id}/collections"
        lambda do
          get :destroy_collection, :id => @my_private_collection
          response.should redirect_to("/users/#{@user.id}/collections")
        end.should change(Collection, :count).by(-1)
      end

      it "should destroy my public collection" do
        request.env["HTTP_REFERER"] = "/users/#{@user.id}/collections"
        lambda do
          get :destroy_collection, :id => @my_public_collection
          response.should redirect_to("/users/#{@user.id}/collections")
        end.should change(Collection, :count).by(-1)
      end
    end

    describe "edit collection" do
      
      it "should have an option to edit collection title" do
        get :edit, :id => @my_private_collection
        response.should have_selector('label', :content => "Title")
        response.should have_selector('input', :value => "my private collection")
      end
      
      it "should have an option to edit collection description" do
        get :edit, :id => @my_private_collection
        response.should have_selector('label', :content => "Description")
        response.should have_selector('textarea', :content => "description")
      end
      
      it "should have an option to edit collection status" do
        get :edit, :id => @my_private_collection
        response.should have_selector('input', :value => "0")
      end
      
      it "should have an option to upload an image for a collection" do
        get :edit, :id => @my_private_collection
        response.should have_selector('input', :type => "file")
      end
      
      describe "update fail" do
        before(:each) do
          @attr={:user_id => @user.id, :title => "",:description => "", :last_modified_date => Date.today, :status => false}
        end
        it "should enter title for collection" do
          @my_private_collection [:title] = ""
          post :update, :id => @my_private_collection, :collection => @attr
          response.should render_template('edit')
        end
      end
      describe "update success" do
        before(:each) do
          @attr={:user_id => @user.id, :title => "my private collection",:description => "description", :last_modified_date => Date.today, :status => false}
        end
        it "should edit collection with vaild params " do
          post :update, :id => @my_private_collection, :collection => @attr
          response.should redirect_to("/users/#{@user.id}/collections")
        end
      end
    end
    
    describe "show collection" do
      
      it "should display collection title" do
        get :show, :id => @my_private_collection
        response.should have_selector('b', :content => "Collection Title")
        #response.should have_content("my private collection")
      end
      
      it "should display collection description" do
        get :show, :id => @my_private_collection
        response.should have_selector('b', :content => "Collection Description")
        #response.should have_content("description")
      end
      
      it "should display collection status" do
        get :show, :id => @my_private_collection
        response.should have_selector('b', :content => "Status")
        #response.should have_content("Private")
      end
      
      it "should display edit collection link for collection owned by current user" do
        get :show, :id => @my_private_collection
        response.should have_selector('a', :href => "/collections/edit/#{@my_private_collection.id}", :content => "Edit Collection")
      end 
    end
  end
  
  describe "get 'index'" do
    before(:each) do
      truncate_table(ActiveRecord::Base.connection, "users", {})
      User.gen() unless User.first
      @user = User.first
      log_in(@user)
      @other_user = User.gen

      truncate_table(ActiveRecord::Base.connection, "collections", {})
      @my_private_collection = Collection.create(:user_id => @user.id, :title => "my private collection",:description => "description", :last_modified_date => "2013-11-20 ", :status => false)
      @my_public_collection = Collection.create(:user_id => @user.id, :title => "my public collection",:description => "description", :last_modified_date => "2013-11-19 ", :status => true)
      @other_private_collection = Collection.create(:user_id => @other_user.id, :title => "other private collection",:description => "description", :last_modified_date => "2013-11-18 ", :status => false)
      @other_public_collection = Collection.create(:user_id => @other_user.id, :title => "other public collection",:description => "description", :last_modified_date => "2013-11-17 ", :status => true)

    end
    describe "list collections" do
      it "should listall public collections" do
        get :index
        response.should have_selector('div', :class => "count", :content =>2.to_s)
      end

      it "should have an open link for public collections" do
        get :index
        response.should have_selector('a', :href => "/collections/list_books_in_collection/#{@other_public_collection.id}", :content =>@other_public_collection.title)
        response.should have_selector('a', :href => "/collections/list_books_in_collection/#{@my_public_collection.id}", :content =>@my_public_collection.title)
      end

      it "should have last modified date for public collections of ther user" do
        get :index
        response.should have_selector('h5', :content =>"2013-11-17")
        response.should have_selector('h5', :content =>"2013-11-19")
      end

      it "should have pagination bar" do
        truncate_table(ActiveRecord::Base.connection, "collections", {})
        20.times {Collection.create(:user_id => @other_user.id, :title => "other collection",:description => "description", :last_modified_date => "2013-11-20 ", :status => true)}
        get :index
        response.should have_selector('ul', :id => "pagination")
        truncate_table(ActiveRecord::Base.connection, "collections", {})
      end

      it "should have an open link for each collection" do
        get :index
        response.should have_selector('a', :href => "/collections/list_books_in_collection/#{@other_public_collection.id}", :content =>@other_public_collection.title)
        response.should have_selector('a', :href => "/collections/list_books_in_collection/#{@my_public_collection.id}", :content =>@my_public_collection.title)
      end
      it "should have last modified date for each collection" do
        get :index
        response.should have_selector('h5', :content =>"2013-11-17")
        response.should have_selector('h5', :content =>"2013-11-19")
      end
      it "should have an image for each collection" do
        get :index
        response.should have_selector('a>img', :src => "/images_en/defaultCollection.jpg")
      end

      it "should have an meta data link for each collection" do
        get :index
        response.should have_selector('a', :href => "/collections/show/#{@other_public_collection.id}")
        response.should have_selector('a', :href => "/collections/show/#{@my_public_collection.id}")
      end

      it "should have delete link for the collections owned by the current user" do
        get :index
        response.should have_selector('a', :href => "/collections/destroy_collection/#{@my_public_collection.id}")
      end
      
      it "should have search bar" do
        get :index
        response.should have_selector('div', :class => "searchtitle")
        response.should have_selector('input', :id => "searchfield")
      end
      
    it "should search for collections by title" do
      get :index, :params => {"_title" => "collection"}
      response.should have_selector('div', :class => "count", :content =>2.to_s)
    end
    
    it "should search for collections by title" do
      get :index, :_title =>  "other _AND collection"
      response.should have_selector('div', :class => "count", :content =>1.to_s)
    end
    
    it "should have sort features" do
      get :index
      response.should have_selector('a', :href => "/collections?view=title+DESC")
      response.should have_selector('a', :href => "/collections?view=title+ASC")
    end

    end


  end
end