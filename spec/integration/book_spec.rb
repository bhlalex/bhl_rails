require 'spec_helper'
include BHL::Login
describe "books/_right_column.html.haml" do

  before(:each) do
    visit("/books")
  end
  
  it 'should contain tagged species' do
    body.should include "TAGGED SPECIES"
  end
  
  it 'should contain languages' do
    body.should include "LANGUAGES"
  end
  
  it 'should contain authors' do
    body.should include "AUTHORS"
  end
  
  it 'should contain affiliation' do
    body.should include "AFFILIATION"
  end
  
  # this was put here because when put in controller the url not found and tells "LoadError: cannot load such file -- action_controller/integration> " 
  it "should display book image" do
    lambda do
    visit("http://localhost:3000/volumes/123/thumb.jpg")
      end.should_not raise_error
  end
end


