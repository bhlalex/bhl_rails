require File.dirname(__FILE__) + "/../sci_names_indexer"

namespace :sci_names_indexer do
  desc 'Index all scientific names'
  task :index_all_sci_names => :environment do
    SciName::Indexer.index_sci_names
  end
  
  desc 'Delete all documents'
  task :delete_all_from_index => :environment do
    SciName::Indexer.delete_all
  end
end