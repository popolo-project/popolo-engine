module Popolo
  # A physical location or a mail delivery point.
  class Address
    include Mongoid::Document

    embedded_in :addressable, polymorphic: true

    # A human-readable identifier for the address, e.g. "Constituency address".
    field :name, type: String
    # The postal address, in which each line is an element in the array.
    field :address, type: Array
    # The telephone number.
    field :tel, type: Integer
    # The facsimile number.
    field :fax, type: Integer
  end
end
