require 'spec_helper'

describe NamesController do
  render_views # we need it to be able to test response body content 

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
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
