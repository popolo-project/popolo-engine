require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  require 'rails/application'
  # Prevent Spork from caching the routes.
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  # Prevent Spork from caching Popolo classes (see below).
  Spork.trap_method(Rails::Application, :eager_load!)

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

  # Prevent Spork from caching Popolo classes (see above).
  Rails.application.railties.all do |railtie|
    unless railtie.respond_to?(:engine_name) && railtie.engine_name == 'popolo'
      railtie.eager_load!
    end
  end

  # Create non-Popolo indexes.
  Rails.application.railties.engines.each do |engine|
    unless engine.engine_name == 'popolo'
      engine.paths["app/models"].expanded.each do |path|
        Rails::Mongoid.create_indexes("#{path}/**/*.rb")
      end
    end
  end

  require 'database_cleaner'
  require 'factory_girl_rails'
  require 'mongoid-rspec'

  RSpec.configure do |config|
    config.include Mongoid::Matchers

    config.mock_with :rspec

    config.after(:each) do
      DatabaseCleaner.clean
    end

    # http://railscasts.com/episodes/285-spork
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.run_all_when_everything_filtered = true
    config.filter_run focus: true
  end
end

Spork.each_run do
  # DatabaseCleaner will not truncate system.indexes between tests, but it
  # should be truncated before running the full test suite.
  Mongoid::Sessions.default.drop

  # It's now okay to load Popolo.
  Rails.application.railties.engines.each do |engine|
    if engine.engine_name == 'popolo'
      engine.eager_load!
    end
  end

  # Create Popolo indexes.
  Rails.application.railties.engines.each do |engine|
    if engine.engine_name == 'popolo'
      engine.paths["app/models"].expanded.each do |path|
        Rails::Mongoid.create_indexes("#{path}/**/*.rb")
      end
    end
  end

  # Create dummy indexes.
  Rails::Mongoid.create_indexes(File.expand_path("../dummy/app/models/**/*.rb", __FILE__))

  # @todo I18n.backend.reload!
  FactoryGirl.reload
end
