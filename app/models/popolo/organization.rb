module Popolo
  # A structured collection of people.
  #
  # Turtle document:
  #
  #     <http://example.com/organizations/17cc67093475061e3d95369d.ttl>
  #       a org:Organization;
  #       skos:prefLabel "ABC, Inc.";
  #       org:classification [
  #         a skos:Concept;
  #         skos:prefLabel "Company"
  #       ];
  #       rdfs:seeAlso <http://example.com/organizations/17cc67093475061e3d95369d>;
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/vocab-org/
  # @see http://www.w3.org/TR/skos-reference/
  # @see http://dublincore.org/documents/dcmi-terms/
  class Organization
    include Mongoid::Document
    include Mongoid::Paranoia
    include Mongoid::Timestamps
    include Mongoid::Tree

    include Popolo::Mixins::Sluggable
    include Popolo::Mixins::Eventable

    belongs_to :area, index: true, class_name: 'Popolo::Area'
    has_many :posts, class_name: 'Popolo::Post', dependent: :destroy

    # The organization's category.
    field :classification, type: String
  end
end
