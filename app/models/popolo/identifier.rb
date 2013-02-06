module Popolo
  # An issued identifier.
  class Identifier
    include Mongoid::Document

    embedded_in :organization, class_name: 'Popolo::Organization'

    # An issued identifier, e.g. a DUNS number.
    field :identifier, type: String
    # An identifier scheme, e.g. DUNS.
    field :scheme, type: String

    validates_presence_of :identifier
  end
end
