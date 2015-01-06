require File.expand_path('../lib/popolo/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "popolo"
  s.version     = Popolo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Open North"]
  s.email       = ["info@opennorth.ca"]
  s.homepage    = "http://github.com/opennorth/popolo"
  s.summary     = %q{A Rails engine for open government websites.}
  s.license     = 'MIT'

  s.files         = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency('rails', '~> 4.1.0')
  s.add_dependency('inherited_resources', '~> 1.5.1')
  s.add_dependency('mongoid', '~> 4.0.0')
  s.add_dependency('mongoid-tree', '~> 2.0.0')

  s.add_development_dependency('database_cleaner', '~> 1.2')
  s.add_development_dependency('factory_girl_rails', '~> 4.1')
  s.add_development_dependency('guard-bundler', '~> 2.0')
  s.add_development_dependency('guard-rspec', '~> 4.3')
  s.add_development_dependency('rspec-rails', '~> 3.0')
  s.add_development_dependency('coveralls')
  s.add_development_dependency('mongoid-rspec', '~> 2.0.0.rc1')
end
