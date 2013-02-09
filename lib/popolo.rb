require 'popolo/engine'

require 'active_support/concern'
require 'inherited_resources'
require 'mongoid'
require 'mongoid/tree'

module Popolo
  # The parent controller all Popolo controllers inherits from.
  # Defaults to ApplicationController. This should be set early
  # in the initialization process and should be set to a string.
  #
  # @see https://github.com/plataformatec/devise/blob/master/lib/devise.rb#L196
  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'
end

require 'popolo/mixins/sluggable'
