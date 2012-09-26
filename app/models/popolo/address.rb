module Popolo
  # A person's address.
  class Address
    include Mongoid::Document

    embedded_in :person

    # A human-readable identifier for the address, e.g. "Constituency address".
    field :name, type: String
    # The postal address, in which each line is an element in the array.
    field :address, type: Array
    # The telephone number.
    field :tel, type: Integer
    # The telephone number's extension.
    field :ext, type: Integer
    # The facsimile number.
    field :fax, type: Integer

    validates_presence_of :name, :address
  end
end
