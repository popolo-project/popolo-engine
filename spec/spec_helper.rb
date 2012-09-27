require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  # https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  require 'rails/application'
  require 'rails/mongoid'
  Spork.trap_class_method(Rails::Mongoid, :load_models)
  Spork.trap_method(Rails::Application, :eager_load!)

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  Rails.application.railties.all { |r| r.eager_load! }

  require 'database_cleaner'
  require 'factory_girl_rails'
  require 'shoulda/matchers'

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
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
  # @todo I18n.backend.reload!
  FactoryGirl.reload
end
