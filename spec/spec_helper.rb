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

  # https://github.com/pat/combustion
  Bundler.require :default, :development

  Combustion.initialize! :action_controller, :action_view, :sprockets

  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

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
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end
