require File.dirname(__FILE__) + "/../solr_indexer"

namespace :solr_indexer do
  desc 'Index all books'
  task :index_all_books => :environment do
    SOLR::Indexer.index_books(Book.where('fill_metadata_fail=0'))
  end
  
  desc 'Index new books'
  task :index_new_books => :environment do
    SOLR::Indexer.index_books(Book.where('(metadata_index_status is null or metadata_index_status=0) and fill_metadata_fail=0'))
  end
  
  desc 'Delete all documents'
  task :delete_all_from_index => :environment do
    SOLR::Indexer.delete_all
  end
end