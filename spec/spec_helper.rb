require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  begin
    require 'bundler/setup'
  rescue LoadError
    puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
  end

  Bundler.require :default, :development

  # Needs to run before initializing Rails.
  # @see https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  require 'rails/mongoid'
  Spork.trap_class_method(Rails::Mongoid, :load_models)
  Spork.trap_method(Rails::Application, :eager_load!)

  # Needs to run before requiring RSpec.
  # @see https://github.com/pat/combustion
  Combustion.initialize! :action_controller, :action_view, :sprockets

  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujitsu
  Rails.application.railties.all { |r| r.eager_load! }

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
  # I18n.backend.reload!
end
