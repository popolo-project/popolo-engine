module Popolo
  # A position in an organization that exists independently of the person
  # holding it.
  class Post
    include Mongoid::Document

    include Popolo::Sluggable
    index({slug: 1, organization_id: 1}, unique: true)

    # An area related to the post, e.g. an electoral riding.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The organization in which the post exists.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The person holding the post.
    belongs_to :person, index: true, class_name: 'Popolo::Person'
    # The address at which the post is based.
    embeds_many :addresses, as: :addressable, class_name: 'Popolo::Address'

    # The role that the holder of the post fulfills. Roles should preferably
    # belong to a controlled vocabulary.
    field :role, type: String

    validates_presence_of :role, :organization_id
  end
end
