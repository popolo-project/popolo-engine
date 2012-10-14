require 'active_support/concern'

module Popolo
  module Mixins
    autoload :Eventable, 'popolo/mixins/eventable'
    autoload :Sluggable, 'popolo/mixins/sluggable'
  end
end
