require 'spec_helper'

describe "books/_right_column.html.haml" do
  it 'should contain tagged species' do
    render
    rendered.should contain("TAGGED SPECIES")
  end
  
  it 'should contain languages' do
    render
    rendered.should contain("LANGUAGES")
  end
  
  it 'should contain authors' do
    render
    rendered.should contain("AUTHORS")
  end
end
