module Popolo
  # A post in an organization.
  #
  # Turtle document:
  #
  #     <http://example.com/posts/37cc67093475061e3d95369d.ttl>
  #       a org:Post;
  #       skos:prefLabel "Treasurer"
  #       org:heldBy <http://example.com/people/47cc67093475061e3d95369d.ttl>;
  #       org:postIn <http://example.com/organizations/17cc67093475061e3d95369d.ttl>;
  #       dcterms:subject [
  #         a skos:Concept;
  #         skos:prefLabel "Finances"
  #       ];
  #       dcterms:subject [
  #         a skos:Concept;
  #         skos:prefLabel "Legal affairs"
  #       ];
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/vocab-org/
  # @see http://www.w3.org/TR/skos-reference/
  # @see http://dublincore.org/documents/dcmi-terms/
  class Post
    include Mongoid::Document
    include Mongoid::Paranoia
    include Mongoid::Timestamps

    include Popolo::Mixins::Eventable

    # An area related to the post, e.g. an electoral riding.
    belongs_to :area, index: true, class_name: 'Popolo::Area'
    # The organization in which the post exists.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The person holding the post.
    belongs_to :person, index: true, class_name: 'Popolo::Person'

    embeds_many :addresses, as: :addressable, class_name: 'Popolo::Address'

    # The post's name. Names should preferably belong to a controlled
    # vocabulary.
    field :name, type: String
    # The subjects the post is responsible, e.g. a treasurer of an executive
    # committee may be responsible for finances.
    field :subjects, type: Array
  end
end
