require 'popolo/engine'

require 'mongoid'
require 'mongoid/tree'
require 'inherited_resources'
require 'unicode_utils'

module Popolo
  # Raised if a resource is improperly nested in a URL.
  class ImproperlyNestedResource < StandardError; end

  autoload :Mixins, 'popolo/mixins'
end
