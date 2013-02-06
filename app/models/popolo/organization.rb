module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it, e.g. a political structure.
  class Organization
    include Mongoid::Document
    include Mongoid::Tree

    include Popolo::Sluggable

    # An area related to the organization, e.g. a region or country.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The relationships to which the organization is a party.
    has_many :memberships, class_name: 'Popolo::Membership', dependent: :destroy
    # The posts within the organization.
    has_many :posts, class_name: 'Popolo::Post', dependent: :destroy

    # The organization's category.
    field :classification, type: String
  end
end
