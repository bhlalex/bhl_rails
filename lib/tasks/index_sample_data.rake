require File.dirname(__FILE__) + "/../sample_data_indexer"

namespace :sample_data_indexer do
  desc 'Index all scientific names'
  task :index_sample_data => :environment do
    Sampledata::Indexer.index_sample_data
  end
  
  desc 'Delete all documents'
  task :delete_all_from_index => :environment do
    Sampledata::Indexer.delete_all
  end
end