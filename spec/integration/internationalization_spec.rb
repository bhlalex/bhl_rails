# THIS FILE SHOULD BE RUN IN ORDER
# rspec spec/integration/internationalization_spec.rb --order default

require 'spec_helper'
include BHL::Login
describe "internationalization" do
  
  before(:each) do
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    solr.delete_by_query('*:*') 
    solr.commit
  end
  
  it "should allow user to choose a language and default is english", :js => true do
    visit "/"
    #default is english so that the other languages will be displayed
    page.should have_selector("a", :href => "/ar")
  end
  
  it "should use the user's last login language", :js => true do
    truncate_table(ActiveRecord::Base.connection, "users", {})
    @user1 = User.gen(active: true)
    #log in
    visit("/users/login")
    fill_in "username", :with => "#{@user1.username}"
    fill_in "password", :with => "test password"
    find("#submit").click    
    visit("/ar/users/login")
    visit("/users/logout")
    # #log in
    visit("/users/login")
    fill_in "username", :with => "#{@user1.username}"
    fill_in "password", :with => "test password"
    find("#submit").click
    expect(page).to have_selector('a', :href => "/en/users/#{@user1.id}")
  end
  
  it "should use language in the session for not logged in user", :js => true do
    truncate_table(ActiveRecord::Base.connection, "users", {})
    @user1 = User.gen(active: true)
    #log in
    visit("/users/login")
    fill_in "username", :with => "#{@user1.username}"
    fill_in "password", :with => "test password"
    find("#submit").click    
    #choose a language
    visit("/ar/users/login")
    #logout
    visit("/users/logout")
    visit "/"
    #choose a language
    expect(page).to have_selector('a', :href => "/en")
  end
  
  it "should render current page with different language when click on the language", :js => true do
    visit "/books"
    page.should have_selector("a", :href => "/ar/books")
    #choose a language
    visit "/ar/books"
    page.should have_selector("a", :href => "/en/books")
  end  
end