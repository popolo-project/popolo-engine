module Popolo
  # A position that exists independent of the person holding it.
  class Post
    include Mongoid::Document
    include Mongoid::Timestamps
    include DateHandler

    store_in Popolo.storage_options_per_class.fetch(:Post, Popolo.storage_options)

    # The organization in which the post is held.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The memberships through which people hold the post in the organization.
    has_many :memberships, class_name: 'Popolo::Membership'
    # Means of contacting the holder of the post.
    embeds_many :contact_details, as: :contactable, class_name: 'Popolo::ContactDetail'
    # URLs to documents about the post.
    embeds_many :links, as: :linkable, class_name: 'Popolo::Link'
    # URLs to source documents about the post.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A label describing the post.
    field :label, type: String
    # The function that the holder of the post fulfills.
    field :role, type: String
    # The date on which the post was created.
    field :start_date, type: Popolo::DateString
    # The date on which the post was eliminated.
    field :end_date, type: Popolo::DateString

    validates_presence_of :organization_id

    validate :date_formats

    def to_s
      label
    end

    def date_formats
      validate_date_for(:start_date)
      validate_date_for(:end_date)
    end

  end
end
