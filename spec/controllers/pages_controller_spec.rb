require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
# test sending email message to site master
    describe "send contact us message" do
      before(:each) do
        truncate_table(ActiveRecord::Base.connection, "email_messages", {})
        @attr = {:name => "user name",
          :email => "user.email@example.com",
          :subject => "subject",
          :message => "text"}
      end
# sending email message with invlaid paramters should be fail
      describe "send message fail" do
        it "should not send email without sender name" do
          @attr[:name] = ""
          post :send_message, :email_message => @attr
          response.should render_template('contact')
          flash[:error].should be_blank
        end
        it "should not send email without sender email" do
          @attr[:email] = ""
          post :send_message, :email_message => @attr
          response.should render_template('contact')
          flash[:error].should be_blank
        end
        it "should not send email with invalid email" do
          @attr[:email] = "user"
          post :send_message, :email_message => @attr
          response.should render_template('contact')
          flash[:error].should be_blank
        end
        it "should not send email without subject" do
          @attr[:subject] = ""
          post :send_message, :email_message => @attr
          response.should render_template('contact')
          flash[:error].should be_blank
        end
        it "should not send email without body" do
          @attr[:message] = ""
          post :send_message, :email_message => @attr
          response.should render_template('contact')
          flash[:error].should be_blank
        end
      end
 
      # valid email message paramters should be stored in db
      describe "send message success" do
        it "should send email with valid paramters" do
          lambda do
            post :send_message, :email_message => @attr
            response.should redirect_to('/pages/contact')
            flash[:notice].should == I18n.t(:contact_us_message)
          end.should change(EmailMessage, :count).by(1)
        end
      end

    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    
    it "should contain first paragraph" do
      get :about
      ba_link = I18n.t(:ba_name)
      response.should have_selector("p", :content => I18n.t(:about_us_page_1, :ba_link => "#{ba_link}"))
    end
    
    it "should contain first paragraph" do
      get :about
      response.should have_selector("p", :content => I18n.t(:about_us_page_2))
    end
    
    it "should contain the link of liberary home page" do
      get :about
      response.should have_selector("a", :content => I18n.t(:ba_name), :href => I18n.t(:ba_home_page_link))
    end
  end
  
  describe "GET 'home'" do
    
    before(:all) do
      #generate volumes
      truncate_table(ActiveRecord::Base.connection, "books", {})
      truncate_table(ActiveRecord::Base.connection, "volumes", {})
      truncate_table(ActiveRecord::Base.connection, "pages", {})
      truncate_table(ActiveRecord::Base.connection, "names", {})
      truncate_table(ActiveRecord::Base.connection, "page_names", {})
      truncate_table(ActiveRecord::Base.connection, "collections", {})
      truncate_table(ActiveRecord::Base.connection, "authors", {})
      truncate_table(ActiveRecord::Base.connection, "book_views", {})
      truncate_table(ActiveRecord::Base.connection, "comments", {})
      truncate_table(ActiveRecord::Base.connection, "volume_ratings", {})
      truncate_table(ActiveRecord::Base.connection, "collection_ratings", {})
      truncate_table(ActiveRecord::Base.connection, "user_book_histories", {})
      truncate_table(ActiveRecord::Base.connection, "collection_ratings", {})
        
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*')
      solr.commit
      rate = 5
      6.times{ |i|
        doc_test = {:vol_jobid => i.to_s, :bok_bibid => "456"}
        doc_test[:bok_title] = "title#{i}"
        doc_test[:author] = "Author#{i}"
        doc_test[:bok_language]="English"
        doc_test[:geo_location]="Egypt"
        doc_test[:subject]="subject"
        doc_test[:single_bok_title] = "title"
        doc_test[:rate] = rate
        rate = rate - 1 
        doc_test[:views] = i
        solr.add doc_test
        solr.commit
        book = Book.gen(:title => "title#{i}", :bibid => '456')
        Volume.gen(:book => book, :job_id => i.to_s, :get_thumbnail_fail => 1, :rate => i.to_f)
      }
      #generate records in book_views
      BookView.create(:book_id1 => Volume.first.job_id, :book_id2 => Volume.last.job_id)# title1, title6
      
      #generate user
      @user = User.first ? User.first : User.gen
      #generate collections
      Collection.gen(:user_id => @user.id, :title => "11111", :is_public => true, :rate => "1.0")
      Collection.gen(:user_id => @user.id, :title => "55555", :is_public => true, :rate => "5.0")
      Collection.gen(:user_id => @user.id, :title => "55555", :is_public => true, :rate => "5.0")
      Collection.gen(:user_id => @user.id, :title => "55555", :is_public => true, :rate => "5.0")
      Collection.gen(:user_id => @user.id, :title => "55555", :is_public => true, :rate => "5.0")
      Collection.gen(:user_id => @user.id, :title => "55555", :is_public => true, :rate => "5.0")
      
    end
    
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    describe "info part" do
      it "should have info part" do
        get 'home'
        response.should have_selector("h4", :class => "alert alert-success")
        response.should have_selector("h4", :class => "alert alert-warning")
        response.should have_selector("h4", :class => "alert alert-info")
      end
      
      it "should have books number" do
        get 'home'
        response.should have_selector("h4", :class => "alert alert-success", :content => "#{Volume.count}")
      end
      
      it "should have authors number" do
        get 'home'
        response.should have_selector("h4", :class => "alert alert-warning", :content => "#{Volume.count}")
      end
      
      it "should have tagged species number" do
        get 'home'
        response.should have_selector("h4", :class => "alert alert-info", :content => "0")
      end
    end
    
    describe "top collections part" do
      it "should have top collections part" do
        get 'home'
        response.should have_selector("a" , :content => "#{I18n.t(:top_collections)}")
      end
      
      it "should have top rated collections" do
        get 'home'
        response.should have_selector("a", :content => "55555")
      end
      
      it "should not have more then 5 collections" do
        get :home
        response.should_not have_selector("a", :content => "11111")
      end
      
      it "should have title that link to collection index page with sort_type = rate" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:top_collections)}", :href => "/collections?sort_type=rate+desc")
      end
      
      describe "each collection" do
        it "should have image with link" do
          get :home
          response.should have_selector("a>img", :src => "/images_#{I18n.locale}/nocollection140.png")
        end
        it "should have title with link" do
          get :home
          response.should have_selector("a", :content => "55555", :href => "/collections/2")
        end
        it "should have author name" do
          get :home
          response.should have_selector("a", :content => "#{@user.real_name}", :href => "/users/#{@user.id}")
        end
      end
      
    end
    
    describe "most viewed tab" do
      it "should have most viewed tab" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:most_viewed)}")
      end
      
      it "should have more link" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:tabs_more)}", :href => "/books?sort_type=views+desc")
      end
      
      it "should have books ordered by most viewed" do
        get :home
        response.should have_selector("a", :content => "title5")
      end
      
      describe "each book" do
        it "should have volume title with link" do
          get :home
          response.should have_selector("a", :href => "/books/#{Volume.last.job_id}")
        end
        it "should have volume image with link" do
          get :home
          response.should have_selector("a>img", :src => "images_#{I18n.locale}/book_thumb.png")
        end
      end
      
    end
    
    describe "top rated tab" do
      it "should have top rated tab" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:top_rated)}")
      end
      
      it"should have more link" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:tabs_more)}", :href => "/books?sort_type=rate+desc")
      end
      
      it "should have top rated books" do
        get :home
        response.should have_selector("a", :content => "title0")
      end
      
       
      describe "each book" do
       it "should have volume title with link" do
         get :home
         response.should have_selector("a", :href => "/books/#{Volume.first.job_id}")
       end
       it "should have top volume image with link" do
         get :home
         response.should have_selector("a>img", :src => "images_#{I18n.locale}/book_thumb.png")
       end
     end
    end
    
    describe "activities log part" do
      it "should have activities log part" do
        get :home
        response.should have_selector("a", :content => "#{I18n.t(:home_activity_log)}", :href => "/activities/index" )
      end
      it "should display the number of activities" do
        get :home
        response.should have_selector("span", :content => "6")
      end
    end
    
    describe "facebook and twitter sharers" do
      it "should have facebook sharer icon" do
        get :home
        response.should have_selector("i", :class => "fa fa-facebook fa-2x")
      end
      
      it "should have facebook sharer link" do
        get :home
        response.should have_selector("a", :onclick => "shareFb()")
        response.should have_selector("script", :content => "https://www.facebook.com/sharer")
      end
      
      it "should have facebook sharer script" do
        get :home
        response.should have_selector("script", :content => "shareFb()")
        response.should have_selector("script", :content => "https://www.facebook.com/sharer")
      end
      
      it "should have twitter sharer icon" do
        get :home
        response.should have_selector("i", :class => "fa fa-twitter fa-2x")
      end
       
      it "should have twitter sharer link" do
        get :home
        response.should have_selector("a", :href => "https://twitter.com/share")
      end
    end
  end

end
