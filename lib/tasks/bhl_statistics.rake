namespace :bhl_statistics do
  desc 'Load bhl statistics from solr to db'
  task :load_bhl_statistics_from_solr => :environment do
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    facet_array = ["author_ss", "name_ss"]        
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => facet_array,'facet.limit' => 1000000, 'rows' => 0
    BhlStatistic.create(books_count: response['response']['numFound'], authors_count: response["facet_counts"]["facet_fields"]["author_ss"].count/2,
                        species_count: response["facet_counts"]["facet_fields"]["name_ss"].count/2)
  end
end