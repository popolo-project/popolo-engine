module Popolo
  # A position in an organization that exists independently of the person
  # holding it.
  class Post
    include Mongoid::Document
    include Mongoid::Paranoia
    include Mongoid::Timestamps

    include Popolo::Sluggable
    include Popolo::Eventable

    # An area related to the post, e.g. an electoral riding.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The organization in which the post exists.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The person holding the post.
    belongs_to :person, index: true, class_name: 'Popolo::Person'

    embeds_many :addresses, as: :addressable, class_name: 'Popolo::Address'

    # The subjects the post is responsible for, e.g. a treasurer of an executive
    # committee may be responsible for finances.
    field :subjects, type: Array
  end
end
