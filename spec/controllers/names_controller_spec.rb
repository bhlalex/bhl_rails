require 'spec_helper'

describe NamesController do
  render_views # we need it to be able to test response body content 

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "get content right panel" do
    it "should have right panel" do
      get :get_content, :id => 8
      he = HierarchyEntry.find_taxon(8)
      name = he.clean_taxon_concept
      response.should have_selector("h3", :class => "panel-title", :content => "#{name}") 
    end
    
    it "should have species details" do
      get :get_content, :id => 8
      response.should have_selector("a", :content => I18n.t(:species_details), :href => "http://www.eol.org/pages/13")
    end
    
    it "should have the number of books found" do
      get :get_content, :id => 8
      he = HierarchyEntry.find_taxon(8)
      name = he.clean_taxon_concept
      name = name.gsub( /\s/, '+' )
      response.should have_selector("a", :href => "/books?_name=#{name}")
    end
    
  end
  describe "GET 'show'" do
    it "returns kingdoms" do
      get "show"
      response.should be_success
      response.body.include?('Animalia').should be_true
      # I know this is a hard coded string, but this is a name of a kingdom, and I don't think it will ever change
    end
  end
  
  describe "GET 'get_content'" do
    it "returns name of a taxon" do
      he = HierarchyEntry.find_siblings(DEFAULT_HIERARCHY_ID, 0).first
      get "get_content", :id => he.id
      response.should be_success
      response.body.include?(he.clean_taxon_concept).should be_true
    end
  end
  
end
