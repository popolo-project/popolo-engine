module Popolo
  # A relationship between a person and an organization.
  class Membership
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:Membership, Popolo.storage_options)

    # The person who is a party to the relationship.
    belongs_to :person, index: true, class_name: 'Popolo::Person'
    # The organization that is a party to the relationship.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The organization on whose behalf the person is a party to the relationship.
    belongs_to :on_behalf_of, index: true, class_name: 'Popolo::Organization'
    # The post held by the person in the organization through this membership.
    belongs_to :post, index: true, class_name: 'Popolo::Post'
    # Means of contacting the person who is a party to the relationship.
    embeds_many :contact_details, as: :contactable, class_name: 'Popolo::ContactDetail'
    # URLs to documents about the membership.
    embeds_many :links, as: :linkable, class_name: 'Popolo::Link'
    # URLs to documents from which the membership is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A label describing the membership.
    field :label, type: String
    # The role that the person fulfills in the organization.
    field :role, type: String
    # The date on which the relationship began.
    field :start_date, type: DateString
    # The date on which the relationship ended.
    field :end_date, type: DateString

    validates_presence_of :organization_id, :person_id
    validates_format_of :start_date, with: DATE_STRING_FORMAT, allow_blank: true
    validates_format_of :end_date, with: DATE_STRING_FORMAT, allow_blank: true

    def to_s(options = {})
      label || case options[:format]
      when :person
        person.to_s
      when :organization
        organization.to_s
      else
        "#{organization.to_s} / #{person.to_s}"
      end
    end
  end
end
