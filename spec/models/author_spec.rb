require 'spec_helper'

describe Author do

  before(:all) do
    truncate_table(ActiveRecord::Base.connection, 'authors', {})
  end

  it 'Should not add duplicate authors' do
    Author.gen(:name => 'First Author')
    lambda {Author.gen(:name => 'First Author')}.should raise_error
  end
end