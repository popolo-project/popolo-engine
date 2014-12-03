module Popolo
  # A means of contacting an entity.
  class ContactDetail
    include Mongoid::Document
    include Mongoid::Timestamps

    embedded_in :contactable, polymorphic: true
    # URLs to documents from which the contact detail is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A human-readable label for the contact detail.
    field :label, type: String
    # A type of medium, e.g. 'fax' or 'email'.
    field :type, type: String
    # A value, e.g. a phone number or email address.
    field :value, type: String
    # A note, e.g. for grouping contact details by physical location.
    field :note, type: String

    validates_presence_of :type, :value
  end
end
