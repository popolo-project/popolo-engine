module Popolo
  # A person's membership in an organization.
  #
  # Turtle document:
  #
  #     <http://example.com/memberships/37cc67093475061e3d95369d.ttl>
  #       a org:Membership;
  #       org:member <http://example.com/people/47cc67093475061e3d95369d.ttl>;
  #       org:organization <http://example.com/organizations/17cc67093475061e3d95369d.ttl>;
  #       org:role [
  #         a org:Role;
  #         skos:prefLabel "Chair"
  #       ];
  #       dcterms:subject [
  #         a skos:Concept;
  #         skos:prefLabel "Culture"
  #       ];
  #       dcterms:subject [
  #         a skos:Concept;
  #         skos:prefLabel "Heritage"
  #       ];
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/vocab-org/
  # @see http://www.w3.org/TR/skos-reference/
  # @see http://dublincore.org/documents/dcmi-terms/
  class Membership
    include Mongoid::Document
    include Mongoid::Paranoia
    include Mongoid::Timestamps

    belongs_to :person, index: true, class_name: 'Popolo::Person'
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    belongs_to :spatial, polymorphic: true, index: true, class_name: 'Popolo::Area'
    embeds_many :addresses, as: :addressable, class_name: 'Popolo::Address'

    # The person's role in the organization. Roles should preferably belong to a
    # controlled vocabulary.
    field :role, type: String
    # The subjects the person is responsible for in the organization, eg a
    # member of an executive committee may be responsible for culture.
    field :subjects, type: Array
  end
end
