require 'spec_helper'

describe BrowseController do
  render_views
  describe "subjects" do
    before(:all) do
      #add some subjects
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book First"
      doc[:subject]="subject"
      doc[:single_bok_title] = "title"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*') 
      solr.commit
      solr.add doc
      solr.commit
    end
    it "should be success" do
      get :show, :type => "subjects", :char => "all", :search => nil
      response.should be_success
    end
    
    it "should have title" do
      get :show, :type => "subjects", :char => "all", :search => nil
      response.should have_selector("h2", :content => I18n.t(:browse_subject_page_header))
    end
    
    it "should have search bar" do
      get :show, :type => "subjects", :char => "all", :search => nil
      response.should have_selector("input", :class => "form-control")
    end
    
    it "should have letters as search links" do
      get :show, :type => "subjects", :char => "all", :search => nil
      response.should have_selector("a", :href => "z", :content => "Z")
    end
    
    it "should search for the entered value" do
      get :show, :type => "subjects", :char => "all", :search => "subject"
      response.should have_selector("h3", :class => "panel-title", :content => "S")
      response.should have_selector("a", :href => "/books?_subject=subject", :content => "Subject (1)")
    end
  end
  
  describe "authors" do
    before(:all) do
      #add some subjects
      doc = {:vol_jobid => "123", :bok_bibid => "456"}
      doc[:bok_title] = "Test Book First"
      doc[:subject]="subject"
      doc[:author] = ["Author"]
      doc[:single_bok_title] = "title"
      solr = RSolr.connect :url => SOLR_BOOKS_METADATA
      solr.delete_by_query('*:*') 
      solr.commit
      solr.add doc
      solr.commit
    end
    it "should be success" do
      get :show, :type => "authors", :char => "all", :search => nil
      response.should be_success
    end
    
    it "should have title" do
      get :show, :type => "authors", :char => "all", :search => nil
      response.should have_selector("h2", :content => I18n.t(:browse_author_page_header))
    end
    
    it "should have search bar" do
      get :show, :type => "authors", :char => "all", :search => nil
      response.should have_selector("input", :class => "form-control")
    end
    
    it "should have letters as search links" do
      get :show, :type => "authors", :char => "all", :search => nil
      response.should have_selector("a", :href => "a", :content => "A")
    end
    
    it "should search when click on a letter" do
      get :show, :type => "authors", :char => "a"
      response.should have_selector("h3", :class => "panel-title", :content => "A")
      response.should have_selector("a", :href => "/books?_author=Author", :content => "Author (1)")
    end
    
    it "should search for the entered value" do
      get :show, :type => "authors", :char => "all", :search => "author"
      response.should have_selector("h3", :class => "panel-title", :content => "A")
      response.should have_selector("a", :href => "/books?_author=author", :content => "Author (1)")
    end
  end
end
