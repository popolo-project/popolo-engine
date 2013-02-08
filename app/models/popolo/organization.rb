module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it, e.g. a political structure.
  class Organization
    include Mongoid::Document
    include Mongoid::Tree

    include Popolo::Sluggable
    index({slug: 1, parent_id: 1}, unique: true)

    # An area related to the organization, e.g. a region or country.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The relationships to which the organization is a party.
    has_many :memberships, class_name: 'Popolo::Membership', dependent: :destroy
    # The posts within the organization.
    has_many :posts, class_name: 'Popolo::Post', dependent: :destroy
    # The organization's alternate or former names.
    embeds_many :other_names, as: :nameable, class_name: 'Popolo::OtherName'
    # The organization's issued identifiers.
    embeds_many :identifiers, class_name: 'Popolo::Identifier'

    # The organization's category.
    field :classification, type: String
    # The organization's date of founding in ISO 8601:2004 format.
    field :founding_date, type: String
    # The organization's date of dissolution in ISO 8601:2004 format.
    field :dissolution_date, type: String

    validates_format_of :founding_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
    validates_format_of :dissolution_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
  end
end
