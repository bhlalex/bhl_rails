require 'spec_helper'
require_relative '../../lib/bhl/login'

include BHL::Login
describe "users" do
describe "user profile photo" do
  before(:each) do
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    solr.delete_by_query('*:*') 
    solr.commit
    truncate_table(ActiveRecord::Base.connection, "users", {})
    @user1 = User.gen() 
    @user2 = User.gen() 
    @user1.last_login_language = "en"
    @user2.last_login_language = "en"
    
  end
  
  describe "display user avatar" do
    it "should display avatar for user profile without delete photo option" , :js => true do
      
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #sleep 50
      #show user profile
      # check displaying user avatar
      expect(page).to have_selector("img", :src => "/images_en/#{I18n.t(:default_user)}")
      expect(page).not_to have_selector("input", :id => "delete_photo")
    end
  end
  
  describe "display user uploaded photo" do
    before(:each) do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
       # upload photo for user profile
      visit("/users/#{@user1.id}/edit")
      attach_file('photo_name', "#{Rails.root}/public/images_#{I18n.locale}/#{I18n.t(:logo)}")
      find("#submit").click
      visit("/users/logout")
    end
    it "should display uploaded user photo with delete photo option" , :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #sleep 50
      #show user profile
      # check displaying user avatar
      photo_name = "#{(User.find(@user1)).photo_name.thumb}"
      expect(page).to have_selector('img', :src => "#{photo_name}")
      expect(page).to have_selector("input", :id => "delete_photo")
      @user1.photo_name = nil
      FileUtils.remove_dir("#{Rails.root}/public/users/#{@user1.id}") if File.directory? "#{Rails.root}/public/users/#{@user1.id}"
    end
    
    it "should delete uploaded user photo" , :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user1.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      visit("/get_user_profile_photo?id=#{@user1.id}&is_delete=1")
      #sleep 50
      expect(page).to have_selector("img", :src => "/images_en/#{I18n.t(:default_user)}")
      expect(page).not_to have_selector("input", :id => "delete_photo")
      @user1.photo_name = nil
      FileUtils.remove_dir("#{Rails.root}/public/users/#{@user1.id}") if File.directory? "#{Rails.root}/public/users/#{@user1.id}"
    end
    
    it "should display uploaded user photo without delete photo option for ther users" , :js => true do
      #log in
      visit("/users/login")
      fill_in "username", :with => "#{@user2.username}"
      fill_in "password", :with => "test password"
      find("#submit").click
      #show user profile
      visit("/en/users/#{@user1.id}")
      #sleep 50
      # check displaying user avatar
      photo_name = "#{(User.find(@user1)).photo_name.thumb}"
      expect(page).to have_selector('img', :src => "#{photo_name}")
      expect(page).not_to have_selector("input", :id => "delete_photo")
      @user1.photo_name = nil
      FileUtils.remove_dir("#{Rails.root}/public/users/#{@user1.id}") if File.directory? "#{Rails.root}/public/users/#{@user1.id}"
    end
  end
end
end