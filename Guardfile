guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec', cmd: 'bundle exec rspec' do
  watch('Gemfile.lock')                   { "spec" }
  watch(%r{^config/initializers/.+\.rb$}) { "spec" }
  watch(%r{^lib/.+\.rb$})                 { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})      { "spec" }
  watch(%r{^spec/dummy/.+\.rb$})          { "spec" }
  watch('spec/spec_helper.rb')            { "spec" }
  watch('spec/rails_helper.rb')           { "spec" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                        { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})       { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_controller\.rb$}) { |m| "spec/routing/#{m[1]}_routing_spec.rb" }
  watch('config/routes.rb')                        { "spec/routing" }
  watch('app/controllers/popolo_controller.rb')    { "spec/controllers" }
end
