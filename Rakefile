#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler.require :default, :development

task :environment do
  Combustion.initialize! :action_controller, :action_view, :sprockets
end

Combustion::Application.load_tasks

Bundler::GemHelper.install_tasks

task default: :spec
