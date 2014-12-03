require 'rails'

module Popolo
  class Engine < ::Rails::Engine

    isolate_namespace Popolo
    config.autoload_paths << "#{config.root}/app/models/popolo/concerns"

  end
end
