namespace :bhl_statistics do
  desc 'Load bhl statistics from solr to db'
  task :load_bhl_statistics_from_solr => :environment do
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    #facet_array = ["author_ss", "name_ss"]        
    response = rsolr.find :q => "*:*", :fl => "vol_jobid", :facet => true, 'facet.field' => "author_ss",'facet.limit' => 100000, 'rows' => 0        
    BhlStatistic.create(books_count: response['response']['numFound'], authors_count: response["facet_counts"]["facet_fields"]["author_ss"].count,
                        species_count: Name.count)
  end
end
