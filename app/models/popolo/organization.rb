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
  #         skos:prefLabel "Company";
  #       ];
  #       rdfs:seeAlso <http://example.com/people/17cc67093475061e3d95369d>;
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/vocab-org/
  # @see http://www.w3.org/TR/skos-reference/
  # @see http://dublincore.org/documents/dcmi-terms/
  class Organization
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    has_many :memberships
    embeds_many :sources, as: :sourceable
    has_and_belongs_to_many :events, index: true
    belongs_to :spatial, polymorphic: true, index: true

    # The organization's official name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String
    # The organization's category.
    field :classification, type: String

    validates_presence_of :name, :slug

    index({slug: 1}, unique: true)
    index({'sources.name' => 1}, unique: true)

    before_validation :set_slug

    def self.find_by_slug(slug)
      where(slug: slug).first || find(slug)
    end

  private

    # @note Leave it to the content manager to choose a slug in case of conflicts.
    def set_slug
      self.slug ||= name.parameterize if name
    end
  end
end
