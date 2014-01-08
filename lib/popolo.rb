require 'popolo/engine'

require 'active_support/concern'
require 'inherited_resources'
require 'mongoid'
require 'mongoid/tree'

module Popolo
  # The parent controller all Popolo controllers inherit from. Defaults to
  # ApplicationController. This should be set early in the initialization
  # process and should be set to a string.
  #
  # @see https://github.com/plataformatec/devise/blob/master/lib/devise.rb#L196
  mattr_accessor :parent_controller, :storage_options
  @@parent_controller = 'ApplicationController'

  # Used by store_in call in our models. You may configure database and session
  # by setting them in this variable in config/initializers/popolo.rb or the
  # like.
  #
  # @see http://mongoid.org/en/mongoid/docs/documents.html#storage
  @@storage_options = {}
end
