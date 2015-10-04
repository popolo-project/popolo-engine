require File.expand_path('../lib/popolo/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "popolo"
  s.version     = Popolo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James McKinney"]
  s.homepage    = "https://github.com/popolo-project/popolo-engine"
  s.summary     = %q{A Rails engine for open government websites.}
  s.license     = 'MIT'

  s.files         = Dir["{app,config,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency('rails', '~> 4.1.0')
  s.add_dependency('inherited_resources', '~> 1.5.1')
  s.add_dependency('mongoid', '~> 5.0.0')
  s.add_dependency('mongoid-tree', '~> 2.0.1')

  s.add_development_dependency('database_cleaner', '~> 1.5.0')
  s.add_development_dependency('factory_girl_rails', '~> 4.1')
  s.add_development_dependency('guard-bundler', '~> 2.0')
  s.add_development_dependency('guard-rspec', '~> 4.3')
  s.add_development_dependency('rspec-rails', '~> 3.3')
  s.add_development_dependency('coveralls')
  s.add_development_dependency('mongoid-rspec', '~> 3.0.0')
end
