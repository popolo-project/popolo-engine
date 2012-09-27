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
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # Prevent Spork from caching Popolo classes (see above).
  Rails.application.railties.all do |railtie|
    unless railtie.respond_to?(:engine_name) && railtie.engine_name == 'popolo'
      railtie.eager_load!
    end
  end

  require 'database_cleaner'
  require 'factory_girl_rails'
  require 'shoulda/matchers'

  RSpec.configure do |config|
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
  # It's now okay to load Popolo.
  Rails.application.railties.all do |railtie|
    if railtie.respond_to?(:engine_name) && railtie.engine_name == 'popolo'
      railtie.eager_load!
    end
  end

  # @todo I18n.backend.reload!
  FactoryGirl.reload
end
