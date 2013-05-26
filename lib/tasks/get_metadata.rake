require File.dirname(__FILE__) + "/../metadata_downloader"

namespace :dar do

  desc 'Update all metadata'
  task :update_all_metadata => :environment do
    DAR::MetadataDownloader.download_all_metadata
  end
  
  desc 'Update empty or failed metadata'
  task :update_empty_or_failed_metadata => :environment do
    DAR::MetadataDownloader.download_empty_or_failed_metadata
  end
  
  desc 'Resume latest harvest'
  task :resume_last_harvest_metadata => :environment do
    DAR::MetadataDownloader.resume_latest_harvest
  end

end