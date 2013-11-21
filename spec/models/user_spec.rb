require 'spec_helper'

describe User do
  
  before(:each) do
    truncate_table(ActiveRecord::Base.connection, "users", {})
  end
  
  it "should have valid factory" do
    FactoryGirl.build(:user).should be_valid
  end
  
  it "should require a username" do
    lambda {User.gen(:username => "")}.should raise_error
  end
  
  it "should validate username length" do
    User.gen(:username => "youstina").should be_valid
    lambda {User.gen(:username => "123")}.should raise_error
    lambda {User.gen(:username => "123456789012345678")}.should raise_error
  end
  
  it 'should raise error for duplicate username' do
    User.gen(:username => "test_123")
    lambda {User.gen(:username => "test_123")}.should raise_error
  end
  
  it "should require an email" do
    lambda {User.gen(:email => "")}.should raise_error
  end
  
  it 'should raise error for dupplicate email' do
    User.gen(:email => 'test_user@test.com')
    lambda {User.gen(:email => "test_user@test.com")}.should raise_error
  end
  
  it 'should require email in correct format' do
    lambda {User.gen(:email => "test")}.should raise_error
    lambda {User.gen(:email => "test@")}.should raise_error
    lambda {User.gen(:email => "test@test")}.should raise_error
    lambda {User.gen(:email => "test@test.")}.should raise_error
    
    user = User.gen(:email => "test@test.com", :email_confirmation => "test@test.com")
  end
  
  it 'should require password' do
    lambda {User.gen(:entered_password => "", :password => "")}.should raise_error
  end
  
  it 'should validate password length' do
    lambda {User.gen(:entered_password => "123")}.should raise_error
    lambda {User.gen(:entered_password => "1234567890123456789")}.should raise_error
  end
  
  it 'should validate password confirmation' do
    lambda {User.gen(:entered_password => "1234", :entered_password_confirmation => "12345")}.should raise_error
    User.gen(:entered_password => "1234", :entered_password_confirmation => "1234").should be_valid
  end
  
  it 'should validate password hash' do
    pass = "ABC12345"
    Digest::MD5.hexdigest(pass).should == User.hash_password(pass)
  end
  
end