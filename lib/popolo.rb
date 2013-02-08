require 'popolo/engine'

require 'active_support/concern'
require 'inherited_resources'
require 'mongoid'
require 'mongoid/tree'

module Popolo
  # Raised if a resource is improperly nested in a URL.
  class ImproperlyNestedResource < StandardError; end

  # The parent controller all Popolo controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'
end

require 'popolo/mixins/sluggable'
