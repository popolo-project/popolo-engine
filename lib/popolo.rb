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
  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'

  # The database and session storage options used by all Popolo models.
  #
  # @see http://mongoid.org/en/mongoid/docs/documents.html#storage
  mattr_accessor :storage_options
  @@storage_options = {}

  # The storage options for each Popolo model.
  #
  # @see http://mongoid.org/en/mongoid/docs/documents.html#storage
  mattr_accessor :storage_options_per_class
  @@storage_options_per_class = {}
end
