require 'spec_helper'

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
end
