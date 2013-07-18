require 'spec_helper'

describe "books/_tabs.html.haml" do
  it 'should contain Brief tab' do
    render
    rendered.should contain("Brief")
  end
  
  it 'should contain MODS tab' do
    render
    rendered.should contain("MODS")
  end
  
  it 'should contain BibTex tab' do
    render
    rendered.should contain("BibTex")
  end
  
  it 'should contain EndNote tab' do
    render
    rendered.should contain("EndNote")
  end
  
  it 'should contain Read Book link' do
    visit '#' 
    should have_link('Read Book', href: '#')
  end
end