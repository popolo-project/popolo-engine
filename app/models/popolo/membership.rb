module Popolo
  # A relationship between a person and an organization.
  class Membership
    include Mongoid::Document
    include Mongoid::Timestamps

    # An area related to the post, e.g. an electoral riding.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The person who is a party to the relationship.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The organization that is a party to the relationship.
    belongs_to :person, index: true, class_name: 'Popolo::Person'

    # The role that the person fulfills in the organization. Roles should
    # preferably belong to a controlled vocabulary.
    field :role, type: String
  end
end
