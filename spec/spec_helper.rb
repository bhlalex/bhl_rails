# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'


require Rails.root.join('spec', 'eol_factory_girl')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.include Capybara::DSL
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def truncate_all_tables(options = {})
  options[:skip_empty_tables] = true if options[:skip_empty_tables].nil?
  options[:verbose] ||= false

  count = 0
  ActiveRecord::Base.connection.tables.each do |table|
    unless table == 'schema_migrations'
      count += 1
      truncate_table(ActiveRecord::Base.connection, table, options[:skip_empty_tables])      
    end
  end
  puts "-- Truncated #{count} tables in #{ActiveRecord::Base.connection.instance_eval { @config[:database] }}." if options[:verbose]

  Rails.cache.clear if Rails.cache
end

def truncate_table(conn, table, skip_if_empty)
  # run_command = skip_if_empty ? conn.execute("SELECT 1 FROM #{table} LIMIT 1").num_rows > 0 : true
  # conn.execute "TRUNCATE TABLE `#{table}`" if run_command
  conn.execute "TRUNCATE TABLE `#{table}`"
end