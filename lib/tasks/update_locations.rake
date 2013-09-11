require File.dirname(__FILE__) + "/../location_updater"


namespace :bhl do
  desc 'Update empty locations'
  task :update_empty_locations => :environment do
    BHL::LocationUpdater.update_locations
  end
  
  desc 'Remove duplicate locations'
  task :remove_duplicate_locations => :environment do
    BHL::LocationUpdater.remove_duplicate_locations
  end
end