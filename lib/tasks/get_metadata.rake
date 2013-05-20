require File.dirname(__FILE__) + "/../metadata_downloader"

namespace :dar do

  desc 'Update all metadata'
  task :update_all_metadata => :environment do
    DAR::MetadataDownloader.download_all_metadata
  end
  
  desc 'Update empty metadata'
  task :update_empty_metadata => :environment do
    DAR::MetadataDownloader.download_empty_metadata
  end

end