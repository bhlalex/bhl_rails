require 'spec_helper'

describe PagesController do

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
  end

end
