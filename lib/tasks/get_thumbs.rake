require File.dirname(__FILE__) + "/../volume_downloader"

namespace :dar do

  desc 'Download volumes empty thumbnails'
  task :download_thumbs => :environment do
    DAR::VolumeDownloader.download_empty_thumbs
  end
end