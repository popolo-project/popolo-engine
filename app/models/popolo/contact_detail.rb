module Popolo
  # A physical location or a mail delivery point.
  class ContactDetail
    include Mongoid::Document

    embedded_in :addressable, polymorphic: true

    # e.g. "Hill Address" or "Mobile Number"
    field :label, type: String
    # The address' type, e.g. 'capitol'.
    field :type, type: String
    # The value of the contact detail
    field :value, type: String
    # A voice telephone number.
    field :note, type: String
    # e.g. for grouping contact details by physical location

  end
end
