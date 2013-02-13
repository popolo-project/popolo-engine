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
    field :voice, type: String
    # A facsimile telephone number.
    field :fax, type: String
    # A mobile telephone number.
    field :cell, type: String
    # A toll-free telephone number.
    field :tollfree, type: String
    # A video conferencing telephone number.
    field :video, type: String
    # A paging device telephone number.
    field :pager, type: String
    # A telecommunication device for people with hearing or speech difficulties.
    field :textphone, type: String
  end
end
