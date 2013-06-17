require File.dirname(__FILE__) + "/../eol_names"

namespace :eol_names do
  desc 'Download all information from EOL'
  task :download_all_details => :environment do
    EOL::Names.download_all_detalis
  end
  
  desc 'Download missing information from EOL'
  task :download_missing_details => :environment do
    EOL::Names.download_missing_details
  end
  
  desc 'Download all thumbnail for names'
  task :download_all_thumbs => :environment do
    EOL::Names.download_all_thumbs
  end
  
  desc 'Download missing thumbnail for names'
  task :download_missing_thumbs => :environment do
    EOL::Names.download_missing_thumbs
  end
end