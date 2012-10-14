module Popolo
  # A person's membership in an organization.
  #
  # Turtle document:
  #
  #     <http://example.com/memberships/37cc67093475061e3d95369d.ttl>
  #       a org:Membership;
  #       org:member <http://example.com/memberships/47cc67093475061e3d95369d.ttl>
  #       org:organization <http://example.com/memberships/17cc67093475061e3d95369d.ttl>
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
  #       ].
  #
  class Membership
    belongs_to :person, index: true
    belongs_to :organization, index: true
    belongs_to :spatial, polymorphic: true, index: true
    embeds_many :addresses, as: :addressable

    # The person's role in the organization. Roles should preferably belong to a
    # controlled vocabulary.
    field :role, type: String
    # The subjects the person is responsible for in the organization, eg a
    # member of an executive committee may be responsible for culture.
    field :subjects, type: Array
  end
end
