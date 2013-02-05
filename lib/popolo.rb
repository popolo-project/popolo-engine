require 'popolo/engine'

require 'active_support/concern'
require 'inherited_resources'
require 'mongoid'
require 'mongoid/tree'
require 'unicode_utils'

module Popolo
  # Raised if a resource is improperly nested in a URL.
  class ImproperlyNestedResource < StandardError; end
end

require 'popolo/mixins/sluggable'
