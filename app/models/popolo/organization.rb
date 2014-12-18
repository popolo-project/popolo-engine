module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it.
  class Organization
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    store_in Popolo.storage_options_per_class.fetch(:Organization, Popolo.storage_options)

    # The geographic area to which the organization is related.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The memberships of the members of the organization.
    has_many :memberships, class_name: 'Popolo::Membership', dependent: :destroy, inverse_of: :organization
    # Motions within the organization.
    has_many :motions, class_name: 'Popolo::Motion', dependent: :destroy
    # Posts within the organization.
    has_many :posts, class_name: 'Popolo::Post', dependent: :destroy
    # Vote events in which members of the organization are voting.
    has_many :vote_events, class_name: 'Popolo::VoteEvent', dependent: :destroy
    # Votes cast by the organization.
    has_many :votes, as: :voter, class_name: 'Popolo::Vote'
    # Alternate or former names.
    embeds_many :other_names, as: :nameable, class_name: 'Popolo::OtherName'
    # Issued identifiers.
    embeds_many :identifiers, as: :identifiable, class_name: 'Popolo::Identifier'
    # Means of contacting the organization.
    embeds_many :contact_details, as: :contactable, class_name: 'Popolo::ContactDetail'
    # URLs to documents about the organization.
    embeds_many :links, as: :linkable, class_name: 'Popolo::Link'
    # URLs to documents from which the organization is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A primary name, e.g. a legally recognized name.
    field :name, type: String
    # An organization category, e.g. committee.
    field :classification, type: String
    # A date of founding.
    field :founding_date, type: DateString
    # A date of dissolution.
    field :dissolution_date, type: DateString
    # A URL of an image.
    field :image, type: String

    validates_format_of :founding_date, with: DATE_STRING_FORMAT, allow_blank: true
    validates_format_of :dissolution_date, with: DATE_STRING_FORMAT, allow_blank: true
    # @note Add URL validation to match JSON Schema?

    def to_s
      name
    end
  end
end
