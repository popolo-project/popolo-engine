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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.8'
  s.add_dependency 'mongoid', '~> 3.0.6'
  s.add_dependency 'mongoid-tree'
  s.add_dependency 'unicode_utils'
  # s.add_dependency "jquery-rails"

  s.add_development_dependency 'combustion', '~> 0.3.2'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rspec-rails', '~> 2.11'
  s.add_development_dependency 'shoulda-matchers', '~> 1.0'
end
