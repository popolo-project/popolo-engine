module Popolo
  # A relationship between a person and an organization.
  class Membership
    include Mongoid::Document

    # An area related to the membership, e.g. an electoral riding.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The person who is a party to the relationship.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The organization that is a party to the relationship.
    belongs_to :person, index: true, class_name: 'Popolo::Person'

    # The role that the person fulfills in the organization. Roles should
    # preferably belong to a controlled vocabulary.
    field :role, type: String
    # The date on which the relationship began.
    field :start_date, type: String
    # The date on which the relationship ended.
    field :end_date, type: String

    validates_presence_of :organization_id, :person_id
    validates_format_of :start_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
    validates_format_of :end_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
  end
end
