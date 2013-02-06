module Popolo
  # A physical location or a mail delivery point.
  class Address
    include Mongoid::Document

    embedded_in :addressable, polymorphic: true

    # The address' type, e.g. 'capitol'.
    field :type, type: String
    # The postal address.
    field :address, type: String
    # The voice telephone number.
    field :voice, type: Integer
    # The facsimile telephone number.
    field :fax, type: Integer
  end
end
