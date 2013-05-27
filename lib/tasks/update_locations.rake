require File.dirname(__FILE__) + "/../location_updater"


namespace :bhl do
  desc 'Update empty locations'
  task :update_empty_locations => :environment do
    BHL::LocationUpdater.update_locations
  end
end