require File.dirname(__FILE__) + "/../volume_downloader"

namespace :dar do

  desc 'Download volumes empty content'
  task :download_volume_content => :environment do
    DAR::VolumeDownloader.download_empty_volume_content
  end
end