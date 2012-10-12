# coding: utf-8
require 'popolo/engine'

require 'mongoid'
require 'mongoid/tree'
require 'inherited_resources'
require 'unicode_utils'

module Popolo
  class ImproperlyNestedResource < StandardError; end
end
