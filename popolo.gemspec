$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "popolo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "popolo"
  s.version     = Popolo::VERSION
  s.authors     = ["Open North"]
  s.email       = ["info@opennorth.ca"]
  s.homepage    = "http://github.com/opennorth/popolo"
  s.summary     = "A Rails engine for open government websites."

  s.files = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency 'devise', '~> 2.1.2'
  s.add_dependency 'inherited_resources', '~> 1.3.1'
  s.add_dependency 'mongoid', '~> 3.0.6'
  s.add_dependency 'mongoid-tree', '~> 1.0.1'
  s.add_dependency 'unicode_utils', '~> 1.4.0'

  s.add_dependency 'fog', '~> 1.6.0'
  s.add_dependency 'rmagick', '~> 2.13.1'
  # @todo add carrierwave-mongoid dependency when possible

  s.add_development_dependency 'database_cleaner', '~> 0.9'
  s.add_development_dependency 'factory_girl_rails', '~> 4.1'
  s.add_development_dependency 'guard-brakeman', '~> 0.5'
  s.add_development_dependency 'guard-bundler', '~> 1.0'
  s.add_development_dependency 'guard-rspec', '~> 2.1'
  s.add_development_dependency 'guard-spork', '~> 1.2'
  # https://github.com/guard/guard#os-x
  s.add_development_dependency 'rb-fsevent', '~> 0.9'
  s.add_development_dependency 'rspec-rails', '~> 2.11'
  s.add_development_dependency 'mongoid-rspec', '~> 1.5'
  s.add_development_dependency 'spork-rails', '~> 3.2'
end
