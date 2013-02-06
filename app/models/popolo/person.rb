module Popolo
  # A real person, alive or dead.
  class Person
    include Mongoid::Document

    include Popolo::Sluggable

    # The relationships to which the person is a party.
    has_many :memberships, class_name: 'Popolo::Membership'
    # The posts held by the person.
    has_many :posts, class_name: 'Popolo::Post'
    # The person's alternate or former names.
    embeds_many :other_names, as: :nameable, class_name: 'Popolo::OtherName'
    # Links to pages about this person, e.g. Wikipedia, or to accounts this
    # person has on other websites, e.g. Twitter.
    embeds_many :links, class_name: 'Popolo::Link'

    # The person's photo.
    mount_uploader :image, Popolo::ImageUploader

    # The person's family name.
    field :family_name, type: String
    # The person's given name.
    field :given_name, type: String
    # An additional name, e.g. a middle name.
    field :additional_name, type: String
    # An honorific prefix before the person's name, e.g. "Dr.".
    field :honorific_prefix, type: String
    # An honorific suffix after the person's name, e.g. "Jr.".
    field :honorific_suffix, type: String
    # The person's email address.
    field :email, type: String
    # The person's gender, e.g. "male", "female" or another value.
    field :gender, type: String
    # The person's date of birth in ISO 8601:2004 format.
    field :birth_date, type: String
    # The person's date of death in ISO 8601:2004 format.
    field :death_date, type: String
    # The person's one-line biography.
    field :summary, type: String
    # The person's extended biography.
    field :biography, type: String

    validates_presence_of :name
    validates_format_of :birth_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
    validates_format_of :death_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
    # @note Add email address validation to match JSON Schema?
  end
end
