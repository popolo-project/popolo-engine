module Popolo
  # A geographic area whose geometry may change over time.
  class Area
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    store_in Popolo.storage_options_per_class.fetch(:Area, Popolo.storage_options)

    # The memberships to which this area is related.
    has_many :memberships, class_name: 'Popolo::Membership'
    # The organizations to which this area is related.
    has_many :organizations, class_name: 'Popolo::Organization'
    # The posts to which this area is related.
    has_many :posts, class_name: 'Popolo::Post'

    # URLs to documents from which the area is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A primary name.
    field :name, type: String
    # An issued identifier.
    field :identifier, type: String
    # An area category, e.g. city.
    field :classification, type: String
    # A geometry.
    field :geometry, type: String

    def to_s
      name
    end
  end
end
