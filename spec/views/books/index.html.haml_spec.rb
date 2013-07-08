require 'spec_helper'

describe "books/index.html.haml" do
  it 'should contain tagged species' do
    render
    rendered.should contain("TAGGED SPECIES")
  end
end
