# coding: utf-8
require 'popolo/engine'

require 'mongoid'
require 'mongoid/tree'
require 'inherited_resources'
require 'unicode_utils'

module Popolo
  # @see Devise#friendly_token
  def self.friendly_token
    SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
  end
end
