module Popolo
  # A physical location or a mail delivery point.
  class Address
    include Mongoid::Document

    embedded_in :addressable, polymorphic: true

    # The address' type, e.g. 'capitol'.
    field :type, type: String
    # The postal address.
    field :address, type: String
    # A voice telephone number.
    field :voice, type: Integer
    # A facsimile telephone number.
    field :fax, type: Integer
    # A mobile telephone number.
    field :cell, type: Integer
    # A toll-free telephone number.
    field :tollfree, type: Integer
    # A video conferencing telephone number.
    field :video, type: Integer
    # A paging device telephone number.
    field :pager, type: Integer
    # A telecommunication device for people with hearing or speech difficulties.
    field :textphone, type: Integer
  end
end
